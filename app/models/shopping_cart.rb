class ShoppingCart
  delegate :sub_total, to: :order
  

  def initialize(token:)
    @token = token
  end

  def order
    @order ||= Order.find_or_create_by(token: @token, status: 'cart') do |order|
      order.sub_total = 0
    end
  end


  def shipping_cost
    if order.sub_total == 0
      shipping_cost = 0
    else
      shipping_cost = 15
    end 
  end

  def price_total
    price_total = shipping_cost + order.sub_total
  end
  
  def price_stripe
  price_stripe = price_total.to_i * 100
  end

  def items_count
    order_items = order.items.sum(:quantity) 
  end
  
  def add_item(product_id:, quantity: 1, photo:)
    product = Product.find(product_id)

      order_item = order.items.find_or_initialize_by(product_id: product_id)
      order_item.price = product.price
      if order_item.quantity.present?
        order_item.quantity += quantity.to_i
      else order_item.quantity = quantity
      end

    items_count

    ActiveRecord::Base.transaction do
      order_item.save
      update_sub_total!
    end
  end

  def remove_item(id:)
    ActiveRecord::Base.transaction do
      order.items.destroy(id)
      update_sub_total!
    end
  end

  private

  def update_sub_total!
    order.sub_total = order.items.sum('quantity * price')
    order.save
  end

end
