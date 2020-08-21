class DashboardController < ApplicationController
  before_action :check_user_login
  
  def index
    @todays_games = Game.today
    @competitions = Competition.all.limit(5)
    @teams = Team.all.limit(5)
  end
end
