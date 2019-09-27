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
					post :create, params: { product: valid_params }, format: :js
				}.to change(Product, :count).by(1)
			end

			it "will rendering" do
				post :create, params: { product: valid_params }, format: :js
				expect(response).to render_template(:create)
			end
		end
	end

	describe "GET #edit" do
		it "assigns the requested product" do
			product = create :product
			get :edit, params: { id: product.to_param }, xhr: true
			expect(response).to render_template :edit
 		end
	end

	describe "PATCH #update" do
		context "with passing params" do
			it "will redirect to index" do
				product = create :product
				patch :update, params: { id: product.to_param, product: valid_params }, xhr: true
				expect(response).to render_template :update
			end
		end
	end

	describe "DELETE #destroy" do
		it "will be destroy product object" do
			product = Product.create!(valid_params)
			expect {
				delete :destroy, params: { id: product.to_param }
			}.to change(Product, :count).by(-1)
		end
	end
end