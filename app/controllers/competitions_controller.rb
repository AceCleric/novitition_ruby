class CompetitionsController < ApplicationController
  before_action :set_competition, only: %i[show edit update destroy]
  before_action :check_user_login

  def index
    @competitions = Competition.all
  end

  def show
  end

  def new
    @competition = Competition.new
  end

  def edit
  end

  def create
    @competition = Competition.new(competition_params)

    respond_to do |format|
      if @competition.save
        format.html { redirect_to competition_path(@competition.id), notice: 'Competition aangemaakt.' }
        format.json { render :show, status: :created, location: @sport }
      else
        format.html { render :new }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @competition.update(competition_params)
        format.html { redirect_to competition_path(@competition.id), notice: 'Competition bewerkt.' }
        format.json { render :show, status: :ok, location: @competition }
      else
        format.html { render :edit }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @competition.destroy
    respond_to do |format|
      format.html { redirect_to competitions_url, notice: 'Competition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_competition
    @competition = Competition.find(params[:id])
  end

  def set_competitions
    @competitions = parent.competition
  end
  
  def competition_params
    params.require(:competition).permit(:name, :sport_id, :nationality)
  end
end

