class RemoveFieldUserFromTableOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :table_orders, :user, :integer
  end
end
