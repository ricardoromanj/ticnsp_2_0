class CreateChildSemesters < ActiveRecord::Migration
  def change
    create_table :child_semesters do |t|
      t.integer :child_id
      t.integer :semester_id
      t.datetime :paid_at
      t.float :paid_amt
      t.text :notes

      t.timestamps null: false
    end
  end
end
