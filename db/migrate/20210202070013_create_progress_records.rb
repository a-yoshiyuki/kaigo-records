class CreateProgressRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :progress_records do |t|
      t.integer :customer_id, null: false
      t.integer :staff_members_id, null: false
      t.time :time, null: false
      t.text :detail, null: false

      t.timestamps
    end
  end
end
