class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    # @order_details = OrderDetail.where(order_id: params[:id])
    @order_details = @order.order_details
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    order_details = order.order_details
    if order.order_status == "confirmation"
      order_details.update_all(making_status: 1)
    end
    redirect_to admin_order_path
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end



end
