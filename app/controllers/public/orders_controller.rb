class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @customer = current_customer
    @cart_items = @customer.cart_items.all
    @total = 0
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end
  end

  def complete
  end

  def create

  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
