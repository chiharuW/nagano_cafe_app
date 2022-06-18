class Admin::OrderDetailsController < ApplicationController

def update
# @order = Order.find(params[:order_id])
 order_detail = OrderDetail.find(params[:id])
 if order_detail.update(order_detail_params)
  redirect_to admin_order_path(order_detail.order.id), notice: "対応ステータスを更新しました"
 else
  render :show, alert: "対応ステータスを更新できませんでした"
 end
end

private
   def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :amount_billed, :amount, :production_status)
   end


end