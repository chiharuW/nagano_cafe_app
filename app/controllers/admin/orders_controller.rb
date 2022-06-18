class Admin::OrdersController < ApplicationController

 def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order_product_sum = @order_details.all.sum(:amount_billed)

 end

def update
  @order = Order.find(params[:id])
  @order_details = @order.order_details
  @order.update(order_params)
 if @order.status == "payment_confirmation"
    @order_details.update(production_status: "pending")
    redirect_to request.referer
 elsif @order.status == "deliveredcredit_card"
    @order_details.update(production_status: "complete")
    redirect_to request.referer
 else
    redirect_to request.referer
 end
end

  private
   def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_fee, :total_payment, :payment_method, :status)
   end

end
