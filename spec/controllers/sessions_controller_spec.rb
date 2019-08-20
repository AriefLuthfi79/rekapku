require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  context "#create" do
    let(:user) { create :user }

    describe "successfully" do
      it "Should direct to dashboard page" do
        post :create, params: { session: { email: user.email, password: user.password } }
        expect(response).to redirect_to(dashboards_path)
      end

      it "Stores user data to session user_id" do
        post :create, params: { session: { email: user.email, password: user.password } }
        expect(request.session[:user_id]).to eq user.id
      end
    end

    describe "unsuccessfully" do
      it "Should send flash data login invalid" do
        post :create, params: { session: { email: user.email, password: "" } }
        expect(flash[:danger]).to eq "Invalid user email or password"
      end
    end
  end
end
