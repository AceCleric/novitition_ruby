class SportsController < ApplicationController
  before_action :set_sport, only: %i[show edit update destroy]
  before_action :check_user_login

  def index
    @sports = Sport.all
  end

  def show
  end

  def new
    @sport = Sport.new
  end

  def edit
  end

  def create
    @sport = Sport.new(sport_params)

    respond_to do |format|
      if @sport.save
        format.html { redirect_to sport_path(@sport.id), notice: 'Sport aangemaakt.' }
        format.json { render :show, status: :created, location: @sport }
      else
        format.html { render :new }
        format.json { render json: @sport.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sport.update(sport_params)
        format.html { redirect_to sport_path(@sport.id), notice: 'Sport bewerkt.' }
        format.json { render :show, status: :ok, location: @sport }
      else
        format.html { render :edit }
        format.json { render json: @sport.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sport.destroy
    respond_to do |format|
      format.html { redirect_to sports_url, notice: 'Sport was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_sport
    @sport = Sport.find(params[:id])
  end

  def set_sports
    @sports = parent.sport
  end

  def sport_params
    params.require(:sport).permit(:name)
  end
end
