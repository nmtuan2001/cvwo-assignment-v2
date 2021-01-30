FactoryBot.define do
  factory :project do
    project_name { Faker::Lorem.word }
    project_note { Faker::Lorem.word }
    created_by { Faker::Number.number(digits: 10) }
  end
end
