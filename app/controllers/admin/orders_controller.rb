class Admin::OrdersController < ApplicationController

 def show
 end


  private
   def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_fee, :total_payment, :payment_method, :status)
   end

end
