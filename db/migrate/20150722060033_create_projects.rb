class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.datetime :end_date
      t.boolean :completed
      t.text :description

      t.timestamps null: false
    end
  end
end
