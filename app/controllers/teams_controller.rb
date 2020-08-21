class TeamsController < ApplicationController
  before_action :set_team, only: %i[show edit update destroy]
  before_action :set_competition
  before_action :check_user_login

  def index
    @teams = Team.all
  end

  def show
  end

  def new
    @team = Team.new
  end

  def edit
  end

  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to competition_path(@competition.id), notice: "Team #{@team.name} aangemaakt." }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { redirect_to new_competition_team_path(@competition.id), notice: "Failed creating a team"  }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to competition_path(@competition.id), notice: "Team #{@team.name} aangemaakt." }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { redirect_to edit_competition_team_path(@competition.id), notice: "Failed creating a team"  }
        format.json { render json: @team.errors, status: :unprocessable_entity } 
      end
    end
  end

  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_competition
    @competition = Competition.find(params[:competition_id])
  end

  def set_team
    @team = Team.find(params[:id])
  end

  def set_teams
    @teams = parent.team
  end
  
  def team_params
    params.require(:team).permit(:name, :country, :competition_id)
  end
end
