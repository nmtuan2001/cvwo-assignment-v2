FactoryBot.define do
  factory :project do
    title { Faker::Lorem.word }
    note { Faker::Lorem.word }
  end
end
