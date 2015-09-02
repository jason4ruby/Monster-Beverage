class OrdersController < ApplicationController
  before_action :get_all_products, only: [:new, :create]
  def new
    @order = Order.new
  end

  def create
    @order = Order.create(customer: current_or_guest_customer)
    # add selected products to the order
      @products.each do |product|
        if params[product.name]
          @order.add_product(product.name, params["#{product.name}_qty"])
        end
      end

    respond_to do |f|
      if @order.save
        f.html { redirect_to order_shipping_info_path(@order.id) }
      else
        f.html { render :new }
      end
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def shipping_info
    @order = Order.find(params[:id])
    @customer = @order.customer
    unless @customer.valid?
      render :shipping_info
    end
  end

  private

  def get_all_products
    @products = Product.all
  end
end
