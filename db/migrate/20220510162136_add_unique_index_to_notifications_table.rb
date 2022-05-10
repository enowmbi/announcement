class AddUniqueIndexToNotificationsTable < ActiveRecord::Migration[7.0]
  def change
    add_index :notifications, :title, unique: true
  end
end
