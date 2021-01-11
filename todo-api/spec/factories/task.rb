FactoryBot.define do
  factory :task do
    title { Faker::Lorem.word }
    note { Faker::Lorem.word }
    completed false
    deadline { Faker::Time.forward() }
    project_id nil
  end
end
