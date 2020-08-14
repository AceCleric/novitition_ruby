class CompetitionsController < InheritedResources::Base

  private

    def competition_params
      params.require(:competition).permit(:name, :sport_id)
    end

end
