class ProductDatatable < ApplicationDatatable	
	delegate :number_to_currency, to: :@view
	delegate :edit_product_path, to: :@view
	delegate :product_path, to: :@view

	private

	def data
		products.map do |product|
			[].tap do |column|
				column << product.id
				column << product.product_code
				column << product.product_name
				column << product.merk
				column << product.category.name
				column << product.stock
				column << product.discount
				column << number_to_currency(product.price, locale: :id)

				links = []
				links << link_to(fa_icon('pencil'), edit_product_path(product), remote: true)
				links << link_to(fa_icon('trash'), product_path(product), remote: true, method: :delete)
				column << links.join(' | ')
			end
		end
	end

	def products
		@products ||= fetch_products
	end

	def fetch_products
		search = []
		columns.each do |column|
			search << "#{column} like :search"
		end
		
		products = Product.order("#{sort_column} #{sort_direction}")
		products = products.page(page).per(per_page)
		products = products.where(search.join(' or '), search: "%#{params[:search][:value]}%")
	end

	def columns
		%w(id product_code product_name merk stock discount price)
	end

	def count
		Product.count
	end

	def total_entries
		products.total_count
	end
end