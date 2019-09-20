class Admin::ProductsController < ApplicationController
	before_action :authenticate_user!

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

	def new
		@product = Product.new
		@categories = mapping_category
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

	def mapping_category
		Category.all.map { |category| [category.name, category.id] }
	end
end
