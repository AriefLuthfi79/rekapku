require 'rails_helper'

RSpec.feature "Category Features" do
  let(:user) { create :user }

  describe "admin can creates todo" do
    scenario "successfully" do
      sign_in user
      create_category
    end
  end
end
