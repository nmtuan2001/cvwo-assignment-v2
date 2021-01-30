FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    email { "account@gmail.com" }
    password { "password" }
  end
end
