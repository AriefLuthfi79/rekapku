class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    @category.save
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def update
    @category.update(category_params)
    redirect_to categories_url
  end

  def destroy
    @category.destroy
    redirect_to @category
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
