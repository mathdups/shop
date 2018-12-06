class AddIsSentToPurchases < ActiveRecord::Migration[5.1]
  def change
    add_column :purchases, :is_sent, :boolean
  end
end
