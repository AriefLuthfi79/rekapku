class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @category = Category.new
    respond_to do |format|
      format.html
      format.js
    end
  end

end
