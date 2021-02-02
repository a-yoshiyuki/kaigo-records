class CreateMealRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_records do |t|
      t.integer :customer_id, null: false
      t.integer :staff_members_id, null: false
      t.integer :breakfast_main_amount, null: false, default: 0
      t.integer :breakfast_side_amount, null: false, default: 0
      t.integer :lunch_main_amount, null: false, default: 0
      t.integer :lunch_side_amount, null: false, default: 0
      t.integer :dinner_main_amount, null: false, default: 0
      t.integer :dinner_side_amount, null: false, default: 0
      t.integer :water_amount, null: false, default: 0

      t.timestamps
    end
  end
end
