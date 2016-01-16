class CreateRecentItems < ActiveRecord::Migration
  def change
    create_table :recent_items do |t|
      t.integer :visitor_id
      t.integer :recentable_id
      t.string :recentable_type

      t.timestamps null: false
    end
  end
end
