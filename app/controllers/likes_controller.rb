class LikesController < ApplicationController
  before_action :require_login, only:[:create, :destroy]

  def create
    secret = Secret.find(params[:secret_id])
    Like.create(user: current_user, secret: secret)
    redirect_to "/secrets"
  end

  def destroy
    like = Like.find_by(user: current_user, secret: params[:secret_id])
    if like != nil && like.user == current_user
      like.destroy
      redirect_to "/secrets"
    else
      redirect_to "/users/#{current_user.id}"
    end
  end
end