class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy]
  before_action :check_user_login

  def index
    @past_games = Game.past
    @todays_games = Game.today
    @upcoming_games = Game.upcoming
  end

  def show
  end

  def new
    @game = Game.new
    @disable_score_fields = true 
  end

  def edit
  end

  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to game_path(@game.id), notice: 'Game aangemaakt.' }
        format.json { render :show, status: :created, location: @sport }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to game_path(@game.id), notice: 'Game bewerkt.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def set_games
    @games = parent.game
  end
  
  def game_params
    params.require(:game).permit(:first_team_id, :second_team_id, :match_date, :location, :score_first_team, :score_second_team, :prediction_prize)
  end
end

