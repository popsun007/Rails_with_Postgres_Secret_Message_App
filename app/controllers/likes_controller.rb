class LikesController < ApplicationController
  def create
    secret = Secret.find(params[:secret_id])
    Like.create(user: current_user, secret: secret)
    redirect_to "/secrets"
  end

  def destroy
  end
end