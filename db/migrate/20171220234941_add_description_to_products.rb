class AddDescriptionToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :short, :string
  end
end
