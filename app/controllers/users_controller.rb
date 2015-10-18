class UsersController < ApplicationController
  def index
  end

  def new
  end

  def logging_in
  end

  def checking_in
    user = User.find_by_email(params[:email])
    if user != nil && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      flash[:notice] = "Invalid Username or Password"
      redirect_to "/sessions/new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def log_out
    session[:current_user_id] = nil
    redirect_to "/sessions/new"
  end
end
