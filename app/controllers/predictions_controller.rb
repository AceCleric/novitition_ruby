class PredictionsController < ApplicationController
  before_action :set_prediction, only: %i[show edit update destroy]
  before_action :set_user
  before_action :set_game_data, only: %i[new edit]
  before_action :check_user_login

  def index
    @predictions = current_user.predictions
    # getting the predictions which have won
    @won_predictions = @predictions.map(&:passed?).compact
    @pending_predictions = @predictions.map(&:pending?).compact
     
    # All predictions minus the not yet made and won predictions result in the lost predictions
    @lost_predications = @predictions -  @won_predictions -  @pending_predictions
  end

  def show
  end

  def new
    @prediction = Prediction.new
  end

  def edit
  end

  def create
    @prediction = Prediction.new(prediction_params)

    respond_to do |format|
      if @prediction.save
        format.html { redirect_to user_predictions_path(@user.id), notice: 'Added a prediction.' }
        format.json { render :show, status: :created, location: @prediction }
      else
        format.html { redirect_to new_user_prediction_path(current_user.id), notice: "Failed creating prediction." }
        format.json { render json: @prediction.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @prediction.update(prediction_params)
        format.html { redirect_to user_predictions_path(@user.id), notice: 'Updated prediction.' }
        format.json { render :show, status: :created, location: @prediction }
      else
        format.html { redirect_to edit_user_prediction_path(current_user.id), notice: "Failed updating prediction."}
        format.json { render json: @prediction.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @prediction.destroy
    respond_to do |format|
      format.html { redirect_to game_predictions_url, notice: 'Prediction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sync_predictions
    SyncPredictionsJob.new.sync
    redirect_to user_predictions_path(@current_user.id)
  end

  private

  def set_game_data
    @game = Game.find(params[:game_id])
    @playing_teams = [@game.first_team, @game.second_team]
  end

  def set_prediction
    @prediction = Prediction.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_predictions
    @predictions = parent.prediction
  end
  
  def prediction_params
    params.require(:prediction).permit(:team_id, :will_win, :points, :game_id, :user_id)
  end

  def show_user_predictions?
    params[:only_user] == "true"
  end
end
