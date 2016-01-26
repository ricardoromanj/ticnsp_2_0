class CreateCoordinatorSemesters < ActiveRecord::Migration
  def change
    create_table :coordinator_semesters do |t|
      t.integer :coordinator_id
      t.integer :semester_id
      t.text :notes

      t.timestamps null: false
    end
  end
end
