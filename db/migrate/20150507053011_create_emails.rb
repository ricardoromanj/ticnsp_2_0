class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :email
      t.string :email_type
      t.integer :user_id

      t.timestamps null: false
    end

    add_index :emails, :user_id
  end
end
