require 'rails_helper'

RSpec.describe Task, type: :model do

  # Association test
  it { should belong_to(:project) }
  # Validation test
  it { should validate_presence_of(:task_name) }
  it { should validate_presence_of(:task_note) }
  it { should validate_presence_of(:deadline) }
end
