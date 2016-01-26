class CreateGroupOfferings < ActiveRecord::Migration
  def change
    create_table :group_offerings do |t|
      t.integer :group_id
      t.string :group_type
      t.integer :semester_id

      t.timestamps null: false
    end
  end
end
