class RemoveQuantityFromTableProduct < ActiveRecord::Migration[5.1]
  def change
    remove_column :table_products, :quantity, :integer
  end
end
