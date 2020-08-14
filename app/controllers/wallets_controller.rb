class WalletsController < InheritedResources::Base

  private

    def wallet_params
      params.require(:wallet).permit(:credit, :user_id, :add_credit, :remove_credit)
    end

end
