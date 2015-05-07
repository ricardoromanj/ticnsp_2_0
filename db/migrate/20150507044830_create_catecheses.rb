class CreateCatecheses < ActiveRecord::Migration
  def change
    create_table :catecheses do |t|
      t.string :name
      t.string :description
      t.string :image_id

      t.timestamps null: false
    end
  end
end
