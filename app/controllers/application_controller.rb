class ApplicationController < ActionController::Base
  helper_method :current_user

  def check_user_login
    if !current_user
      respond_to do |format|
        format.html { redirect_to new_session_path }
      end
    end
  end
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
end
