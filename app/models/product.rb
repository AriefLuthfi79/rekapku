class Product < ApplicationRecord
	belongs_to :category
	validates_presence_of attribute_names.reject { |attr| attr =~ /id|created_at|updated_at/i }
end
