require 'rails_helper'

RSpec.describe Category, type: :model do
	describe "attribute cannot be blank" do
		it "not valid" do
			category = Category.new(name: nil)
			expect(category).to_not be_valid
		end
	end
end
