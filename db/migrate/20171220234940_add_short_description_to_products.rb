class AddShortDescriptionToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :short_description, :string
  end
end
