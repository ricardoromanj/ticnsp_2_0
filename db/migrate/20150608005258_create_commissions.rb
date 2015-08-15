class CreateCommissions < ActiveRecord::Migration
  def change
    create_table :commissions do |t|
      t.string :name
      t.string :description
      t.string :image_id
      t.integer :semester_id

      t.timestamps null: false
    end
  end
end
