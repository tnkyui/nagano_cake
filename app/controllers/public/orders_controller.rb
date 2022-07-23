class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @customer = current_customer
    @cart_items = @customer.cart_items.all
    @total = 0
    @postage = 800
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end
    @order_new = Order.new
  end

  def complete
  end

  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.save

    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      order_details = OrderDetail.new
      order_details.order_id = order.id
      order_details.item_id = cart_item.item.id
      order_details.amount = cart_item.amount
      order_details.price = cart_item.item.add_tax_intenger
      order_details.save
    end
    @cart_items.destroy_all
    redirect_to complete_orders_path

  end

  def index
    @orders = current_customer.orders.all
    @order_details = OrderDetail.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :postage, :price)
  end
end
