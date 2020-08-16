class PredictionsController < ApplicationController
  before_action :set_prediction, only: %i[show edit update destroy]
  before_action :set_game
  # before_action :set_playing_teams, only: %i[edit update new create]
  before_action :check_user_login

  def index
    @predictions = Prediction.all
  end

  def show
  end

  def new
    @prediction = Prediction.new
    @disable_score_fields = true 
  end

  def edit
  end

  def create
    @prediction = Prediction.new(prediction_params)

    respond_to do |format|
      if @prediction.save
        format.html { redirect_to game_predictions_path(@game), notice: 'Prediction aangemaakt.' }
        format.json { render :show, status: :created, location: @sport }
      else
        format.html { render :new }
        format.json { render json: @prediction.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @prediction.update(prediction_params)
        format.html { redirect_to game_predictions_path(@game), notice: 'Prediction bewerkt.' }
        format.json { render :show, status: :ok, location: @prediction }
      else
        format.html { render :edit }
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

  private

  def set_prediction
    @prediction = Prediction.find(params[:id])
  end

  def set_game
    @game = Game.find(params[:game_id])
    @playing_teams = [@game.first_team, @game.second_team]
  end

  def set_predictions
    @predictions = parent.prediction
  end
  
  def prediction_params
    params.require(:prediction).permit(:team_id, :will_win, :points, :game_id, :user_id)
  end
end
