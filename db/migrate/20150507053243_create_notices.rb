class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :heading
      t.string :text
      t.string :audience
      t.string :notice_type

      t.timestamps null: false
    end
  end
end
