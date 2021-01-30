class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # Associations
  has_many :projects, foreign_key: :created_by
  
  # Validation
  validates_presence_of :username, :email, :password_digest
end
