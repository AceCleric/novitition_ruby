class DashboardController < ApplicationController
  before_action :check_user_login
  
  def index
    @upcoming_games = Game.upcoming
    @todays_games = Game.today
    @competitions = Competition.all
    @teams = Team.all
  end
end
