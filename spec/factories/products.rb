FactoryBot.define do
  factory :product do
  	category
  	product_code { Faker::Code.imei }
  	product_name { Faker::Name.name }
  	merk { "Indomie" }
  	stock { 55 }
  	discount { 10 }
  	price { 10000 }
  end
end
