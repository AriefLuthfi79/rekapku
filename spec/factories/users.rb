FactoryBot.define do
  factory :user do
    username { "Arief Luthfi" }
    email { Faker::Internet.email }
    password { "testing123" }
    password_confirmation { "testing123" }
  end
end
