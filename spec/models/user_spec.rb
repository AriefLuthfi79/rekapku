require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#digest" do
    it "return the hash digest not to be nil" do
      string = SecureRandom.urlsafe_base64
      expect(User.digest(string)).to_not eq(nil)
    end
  end

  describe "#authenticate?" do
    let(:user) { create :user }

    it "return true if digest authenticate" do
      data = User.find_by(email: user.email)
      data.remember
      auth = data.authenticate? :remember, data.remember_token
      expect(auth).to be_truthy
    end
  end
end
