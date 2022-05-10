class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.string :title
      t.date :start_date, default: Date.current
      t.date :end_date, default: Date.current
      t.boolean :system, default: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
