require 'rails_helper'

RSpec.feature "User visit dashboard", type: :feature do
  let(:user) { create :user }

  scenario "successfully" do
    sign_in(user)
    expect(page).to have_css 'h1', text: "Dashboard"
  end
end
