class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :name
      t.string :lastname
      t.string :gender
      t.string :birthdate
      t.string :image_id
      t.string :allergies
      t.string :notes

      t.timestamps null: false
    end
  end
end
