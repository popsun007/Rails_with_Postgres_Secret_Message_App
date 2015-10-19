class LikesController < ApplicationController
  def create
    secret = Secret.find(params[:secret_id])
    Like.create(user: current_user, secret: secret)
    redirect_to "/secrets"
  end

  def destroy
    like = Like.find_by(user: current_user, secret: params[:id])
    like.destroy
    redirect_to "/secrets"
  end
end