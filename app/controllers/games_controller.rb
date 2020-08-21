class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy mock_game_result]
  before_action :set_competition, except: %i[index]
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
        format.html { redirect_to competition_path(@competition.id), notice: "Game #{@game.first_team.name} vs #{@game.second_team.name} created." }
        format.json { render :show, status: :created, location: @competition }
      else
        format.html { redirect_to edit_competition_game_path(@competition.id, @game), notice: "Failed creating a game"  }
        format.json { render json: @competition.errors, status: :unprocessable_entity } 
      end
    end
  end

  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to competition_path(@competition.id), notice: "Game #{@game.first_team.name} vs #{@game.second_team.name} updated." }
        format.json { render :show, status: :created, location: @competition }
      else
        format.html { redirect_to edit_competition_game_path(@competition.id, @game), notice: "Failed updating a game"  }
        format.json { render json: @competition.errors, status: :unprocessable_entity } 
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

  def mock_game_result
    random_score1 = rand(1..6)
    random_score2 = rand(1..6)
    @game.update(score_first_team: random_score1, score_second_team:  random_score2, match_date: Time.zone.now - 1.days)
    redirect_to games_path, notice: "Mocked game results of game: #{@game.first_team.name} vs #{@game.second_team.name}"
  end

  private

  def set_competition
    @competition = Competition.find(params[:competition_id])
  end

  def set_game
    @game = Game.find(params[:id])
  end

  def set_games
    @games = parent.game
  end
  
  def game_params
    params.require(:game).permit(:first_team_id, :second_team_id, :match_date, :location, :score_first_team, :score_second_team, :prediction_prize, :competition_id)
  end
end

