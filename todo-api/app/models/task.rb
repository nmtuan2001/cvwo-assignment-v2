class Task < ApplicationRecord
  belongs_to :project

  # validation
  validates_presence_of :task_name, :task_note, :deadline
end
