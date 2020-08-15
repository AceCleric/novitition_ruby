class DashboardController < ApplicationController
  def index
    if !current_user
      respond_to do |format|
        format.html { redirect_to new_session_path }
      end
    end
  end
end
