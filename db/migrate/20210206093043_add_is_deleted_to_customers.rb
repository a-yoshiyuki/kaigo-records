class AddIsDeletedToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :is_deleted, :integer
    change_column_null :customers, :is_deleted, false, 0
    change_column :customers, :is_deleted, :integer, default: 0
  end
end
