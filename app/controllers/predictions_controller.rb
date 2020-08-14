class PredictionsController < InheritedResources::Base

  private

    def prediction_params
      params.require(:prediction).permit(:team_id, :will_win, :user_id, :points)
    end

end
