class TeamsController < InheritedResources::Base

  private

    def team_params
      params.require(:team).permit(:name, :country, :competition_id)
    end

end
