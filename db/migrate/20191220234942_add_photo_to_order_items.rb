class AddPhotoToOrderItems < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :photo, :string
  end
end
