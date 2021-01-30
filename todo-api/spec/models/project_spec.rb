require 'rails_helper'

RSpec.describe Project, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"

  # Association test
  it { should have_many(:tasks).dependent(:destroy) }
  # Validation tests
  it { should validate_presence_of(:project_name) }
  it { should validate_presence_of(:project_note) }
  it { should validate_presence_of(:created_by) }
end
