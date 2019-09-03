require 'rails_helper'

RSpec.describe Admin::CategoriesController, type: :controller do
  let(:user) { create :user }

  before { subject.send(:log_in, user) }

  describe "POST #create" do
    let(:valid_params) { { category: { name: "Barang Pecah" } } }
    let(:invalid_params) { { category: { name: nil } } }

    context 'with passing params' do
      it "creates new category" do
        expect {
          post :create, params: valid_params, format: :js
        }.to change(Category, :count).by(1)
      end
    end

    context "with invalid params" do
    end
  end
end
