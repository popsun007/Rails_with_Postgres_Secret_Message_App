class SecretsController < ApplicationController
  def index
    @secrets = Secret.all
  end

  def create
    # also can use hidden input pass a param
    user = User.find(session[:current_user_id])
    user.secrets.create(secret_params)
    redirect_to "/users/#{user.id}"
  end

  def destroy
    Secret.find(session[:current_user_id]).destroy
    redirect_to "/users/#{session[:current_user_id]}"
  end
private
  def secret_params
    params.require(:secret).permit(:content)
  end
end
