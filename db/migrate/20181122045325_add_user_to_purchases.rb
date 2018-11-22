class AddUserToPurchases < ActiveRecord::Migration[5.1]
  def change
    add_column :purchases, :user_id, :integer
  end
end
