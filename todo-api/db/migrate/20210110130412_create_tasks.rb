class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :task_note
      t.boolean :completed
      t.datetime :deadline
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
