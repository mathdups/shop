class RemoveShortFromTableProduct < ActiveRecord::Migration[5.1]
  def change
    remove_column :table_products, :short, :string
  end
end
