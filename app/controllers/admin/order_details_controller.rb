class Admin::OrderDetailsController < Admin::ApplicationController

  def update
    order_detail = OrderDetail.find(params[:id])
    order = order_detail.order
    order_details = order.order_details
    order_detail.update(order_detail_params)
    if order_detail.making_status == "making"
      order.update(order_status: 2)
    elsif order_details.count == order_details.where(making_status: "complete").count
      order.update(order_status: 3)
    end
    redirect_to admin_order_path(id: order_detail.order)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
