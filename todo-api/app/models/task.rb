class Task < ApplicationRecord
  belongs_to :project

  # validation
  validates_presence_of :title
  validates_presence_of :note
  validates_presence_of :completed
  validates_presence_of :deadline
end
