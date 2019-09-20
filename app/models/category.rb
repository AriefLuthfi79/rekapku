class Category < ApplicationRecord
  validates_presence_of :name

  has_many :products, class_name: 'Product', dependent: :destroy
end
