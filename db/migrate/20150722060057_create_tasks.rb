class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.datetime :end_date
      t.boolean :completed
      t.text :description
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
