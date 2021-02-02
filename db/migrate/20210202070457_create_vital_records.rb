class CreateVitalRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :vital_records do |t|
      t.integer :customer_id, null: false
      t.integer :staff_members_id, null: false 
      t.time :time, null: false
      t.string :body_temperature, null: false
      t.string :blood_pressure, null: false
      t.string :heart_rate, null: false
      t.string :oxygen, null: false

      t.timestamps
    end
  end
end
