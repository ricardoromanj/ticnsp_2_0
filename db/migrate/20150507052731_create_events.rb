class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date_start
      t.datetime :date_end
      t.string :description
      t.string :latitude
      t.string :longitude
      t.string :location
      t.string :audience

      t.timestamps null: false
    end
  end
end
