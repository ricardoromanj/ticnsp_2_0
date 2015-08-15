class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :name
      t.string :description
      t.string :image_id
      t.integer :semester_id

      t.timestamps null: false
    end
  end
end
