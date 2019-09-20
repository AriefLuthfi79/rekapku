class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    	t.string  :product_code, unique: true
    	t.string  :product_name
    	t.string  :merk
    	t.integer :stock
    	t.integer :discount
    	t.bigint  :price

    	t.references :category, foreign_key: true
    	t.timestamps
    end
  end
end