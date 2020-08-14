class GamesController < InheritedResources::Base

  private

    def game_params
      params.require(:game).permit(:first_team, :second_team, :match_date, :location, :score_first_team, :score_second_team)
    end

end
