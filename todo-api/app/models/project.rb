class Project < ApplicationRecord
  # model association
  has_many :tasks, dependent: :destroy

  # validations
  validates_presence_of :project_name, :project_note, :created_by
end
