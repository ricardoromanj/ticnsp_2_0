class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number
      t.string :phone_type
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
