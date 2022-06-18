class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all
    # @order = Order.find(params[:id])
    # @order_detail = @order.order_detail
  end


end
