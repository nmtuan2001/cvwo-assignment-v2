FactoryBot.define do
  factory :task do
    task_name { Faker::Lorem.word }
    task_note { Faker::Lorem.word }
    completed { False }
    deadline { Faker::Time.forward() }
    project_id nil
  end
end
