class CreateGroupEnrollments < ActiveRecord::Migration
  def change
    create_table :group_enrollments do |t|
      t.integer :group_offering_id
      t.string :enrolled_type
      t.integer :enrolled_id

      t.timestamps null: false
    end
  end
end
