class ChangeNoticeTextFromStringToText < ActiveRecord::Migration
  def change
    change_column :notices, :text, :text, limit: 2147483647
  end
end
