class AddBloodPressureHighToVitalRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :vital_records, :blood_pressure_high, :string
    change_column_null :vital_records, :blood_pressure_high, false
  end
end
