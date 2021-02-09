class RemoveBloodPressureFromVitalRecords < ActiveRecord::Migration[5.2]
  def change
    remove_column :vital_records, :blood_pressure, :string
  end
end
