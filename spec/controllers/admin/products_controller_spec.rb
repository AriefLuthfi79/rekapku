require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do
	let(:user) { create :user }
	let(:category) { create :category }
	let(:valid_params) {
		FactoryBot.attributes_for(:product, category_id: category.id)
	}

	before { subject.send(:log_in, user) }

	describe "GET #index" do
		before { get :index }
		it { expect(response).to render_template :index }
	end

	describe "POST #create" do
		context "with valid params" do
			it "creates a new product" do
				expect {
					post :create, params: { product: valid_params }
				}.to change(Product, :count).by(1)
			end
		end
	end
end