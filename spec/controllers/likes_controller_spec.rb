require 'rails_helper'
RSpec.describe LikesController, type: :controller do
  
  before do
    @user = create_user
    @secret = @user.secrets.create(content: "This is No.1 secret")
  end

  describe "when not logged in" do
    before do
      session[:current_user_id] = nil
    end

    it "can not create like" do
      post :create 
      expect(response).to redirect_to "/sessions/new"
    end
    it "can not destroy like" do
      delete :destroy, id: @secret.id
      expect(response).to redirect_to "/sessions/new"
    end
  end

  describe "when sign in as the wrong user" do
    before do
      @wrong_user = create_user "Frank", "pohep@me.com"
      @secret = @user.secrets.create(content: "This is No.1 secret")
      session[:current_user_id] = @wrong_user.id
      @like = Like.create(user: @user, secret: @secret)
    end
    it "can not unlike as the wrong user" do
      delete :destroy, id: @wrong_user.id
      expect(response).to redirect_to("/users/#{@wrong_user.id}")
    end
  end
end








