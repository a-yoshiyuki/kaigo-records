class ChangeColumnToVitalRecord < ActiveRecord::Migration[5.2]
  def up
    change_column :vital_records, :time, :time, default: ""
    change_column :vital_records, :body_temperature, :string, default: 0
    change_column :vital_records, :heart_rate, :string, default: 0
    change_column :vital_records, :oxygen, :string, default: 0
    change_column :vital_records, :blood_pressure_high, :string, default: 0
    change_column :vital_records, :blood_pressure_low, :string, default: 0
  end

  def down
    change_column :vital_records, :time, :time, null: false
    change_column :vital_records, :body_temperature, :string, null: false
    change_column :vital_records, :heart_rate, :string, null: false
    change_column :vital_records, :oxygen, :string, null: false
    change_column :vital_records, :blood_pressure_high, :string, null: false
    change_column :vital_records, :blood_pressure_low, :string, null: false
  end
end
