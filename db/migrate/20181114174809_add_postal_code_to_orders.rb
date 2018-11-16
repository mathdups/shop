class AddPostalCodeToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :postal_code, :integer
  end
end
