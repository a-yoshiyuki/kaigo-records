class ChangeColumnStaffMember < ActiveRecord::Migration[5.2]
  def change
    rename_column :staff_members, :first_namel, :first_name
  end
end
