module OrderCountObserver
  extend ActiveSupport::Concern

  included do
    after_save :increse_count,:increse_total_sold_unit
    after_save :order_feeds, if: :customer
  end

  def increse_count
    Pusher['broadcast'].trigger!('total_order_shipped', value: Order.shipped.count)
  end

  def increse_total_sold_unit
    Pusher['broadcast'].trigger!('total_units_sold', value: Order.units_sold)
  end

  def order_feeds
   Pusher['broadcast'].trigger!('order_feeds', {value: "#{order.customer.first_name} just purchased from #{order.customer.city}, #{order.customer.country}",id: order.id})
  end
end
