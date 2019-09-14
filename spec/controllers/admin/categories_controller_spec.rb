require 'rails_helper'

RSpec.describe Admin::CategoriesController, type: :controller do
  let(:user) { create :user }
  let(:valid_params) { { category: { name: "Barang Pecah" } } }
  let(:invalid_params) { { category: { name: nil } } }


  before { subject.send(:log_in, user) }

  describe "POST #create" do
    context 'with passing params' do
      it "creates new category" do
        expect {
          post :create, params: valid_params, format: :js
        }.to change(Category, :count).by(1)
      end

      it "will rendering" do
        post :create, params: valid_params, format: :js
        expect(response).to render_template(:create)
      end
    end

    context "with invalid params" do
      it "to not rendering" do
        post :create, params: invalid_params, format: :js
        expect(response).to_not render_template(:index)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroy the category object" do
      category = Category.create!(name: "Testing")
      expect {
        delete :destroy, params: { id: category.to_param }
      }.to change(Category, :count).by -1
    end

    it "to redirect index" do
      category = Category.create!(name: "Testing")
      delete :destroy, params: { id: category.to_param }
      expect(response).to redirect_to(categories_path)
    end
  end

  describe "PATCH #update" do
    context "with passing params" do
      it "will rendering index" do
        category = Category.create! name: "Testing"
        patch :update, params: { id: category.to_param, category: valid_params }
        expect(response).to redirect_to categories_path
      end
    end
  end
end
