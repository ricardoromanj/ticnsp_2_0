class CreateVisitorMessages < ActiveRecord::Migration
  def change
    create_table :visitor_messages do |t|
      t.string :name
      t.string :email
      t.string :message_text
      t.boolean :read
      t.timestamp :read_at
      t.boolean :replied
      t.timestamp :replied_at
      t.integer :replied_by_user_id

      t.timestamps null: false
    end
  end
end
