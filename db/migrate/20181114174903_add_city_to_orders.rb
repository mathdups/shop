class AddCityToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :city, :string
  end
end
