class RenameMealRecordStaffMemer < ActiveRecord::Migration[5.2]
  def change
    rename_column :meal_records, :staff_members_id, :staff_member_id
  end
end
