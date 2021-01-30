require 'rails_helper'

RSpec.describe User, type: :model do
  # Association test
  it { should have_many(:projects) }

  # Validation test
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
end

