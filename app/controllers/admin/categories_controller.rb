class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def index; end
end
