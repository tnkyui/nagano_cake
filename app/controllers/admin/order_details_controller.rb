class Admin::OrderDetailsController < Admin::ApplicationController

  def update
    order_detail = OrderDetail.find(params[:id])
    order_details = OrderDetail.where(order_id: params[:order_detail][:order_id]).pluck(:making_status)
    order_detail.update(order_detail_params)
    if order_detail.making_status == "making"
      order_detail.order.update(order_status: 2)
    elsif order_details.all?{ |s| s == "complete" }
      order_detail.order.update(order_status: 3)
    end
    redirect_to admin_order_path(id: order_detail.order)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
