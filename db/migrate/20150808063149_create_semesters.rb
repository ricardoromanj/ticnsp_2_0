class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.string :name
      t.datetime :date_start
      t.datetime :date_end

      t.timestamps null: false
    end
  end
end
