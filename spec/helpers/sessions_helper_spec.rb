require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  let(:user) { create :user }

  describe "#logged_in?" do
    it "return true if logged in" do
      log_in user
      expect(logged_in?).to be_truthy
    end
  end

  describe "#current_user" do
    it "get current user if logged in" do
      log_in user
      expect(current_user).to eq(user)
    end
  end
end
