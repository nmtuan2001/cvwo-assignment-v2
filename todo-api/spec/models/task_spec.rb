require 'rails_helper'

RSpec.describe Task, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  # Association test
  it { should belong_to(:project) }
  # Validation test
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:note) }
  it { should validate_presence_of(:completed) }
  it { should validate_presence_of(:deadline) }
end
