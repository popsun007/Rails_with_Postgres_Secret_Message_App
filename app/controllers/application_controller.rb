class ApplicationController < ActionController::Base
  
  def current_user
    if session[:current_user_id]
      User.find(session[:current_user_id])
    end
  end

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to "/users/#{current_user.id}"
    end
  end

  helper_method :current_user
  protect_from_forgery with: :exception
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def require_login
    if session[:current_user_id] == nil
      redirect_to "/sessions/new"
    end
  end
  
end
