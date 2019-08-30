class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    category.save
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
