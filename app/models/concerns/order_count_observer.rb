module OrderCountObserver
  extend ActiveSupport::Concern

  included do
    after_save :increse_count,:increse_total_sold_unit
  end

  def increse_count
    Pusher['broadcast'].trigger!('total_order_shipped', value: Order.shipped.count)
  end

  def increse_total_sold_unit
    Pusher['broadcast'].trigger!('total_units_sold', value: Order.units_sold)
  end
end
