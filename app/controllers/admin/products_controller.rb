class Admin::ProductsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_product, only: [:edit, :update, :destroy]

	def index
		respond_to do |format|
			format.html
			format.json { render json: ProductDatatable.new(view_context) }
		end
	end

	def create
		@product = Product.new(product_params)
		@product.save
	end

	def edit; end

	def new
		@product = Product.new
		@categories = mapping_categories
	end

	private

	def product_params
		params.require(:product).permit(
			:product_name,
			:product_code,
			:merk,
			:category_id,
			:stock,
			:discount,
			:price
		)
	end

	def set_product
		@product = Product.find(params[:id])
	end

	def mapping_categories
		Category.all.map { |category| [category.name, category.id] }
	end
end
