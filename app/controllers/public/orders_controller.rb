class Public::OrdersController < ApplicationController


 def new
  @order = Order.new
  @orders = current_customer.cart_items
  # @customer = current_customer
  # @addresses = current_customer.addresses
 end

 def comfirm
  @order = Order.new(order_params)
  if params[:order][:address_number] == "1"
    @order.postal_code = current_customer.postal_code
    @order.name = current_customer.last_name
    @order.address = current_customer.address

  elsif params[:order][:address_number] == "2"
    if @address = Address.find(params[:order][:address_id])
       @order.postal_code = @address.postal_code
       @order.address = @address.address
       @order.name = @address.name
    else
      render :new
    end
  elsif params[:order][:address_number] == "3"
    address_new = current_customer.addresses.new(address_params)
    if address_new.save
    else
      render :new
    end
  end
   @cart_items = current_customer.cart_items.all
   @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal } #ヒドゥンフィールドでクリエイトに送る
   @shipping_fee = 800
 end

 def create
  cart_items = current_customer.cart_items.all
  @order = current_customer.orders.new(order_params)
  #@order.total_payment = 　#ヒドゥンでもらう
  if @order.save
     cart_items.each do |cart_item|
      order_detail = OrderDetail.new(order_detail_params)
      order_detail.order_id = @order.id
      order_detail.item_id = cart_item.item_id
      order_detail.amount = cart_item.amount
      order_detail.amount_billed = cart_item.subtotal
      order_detail.production_status = 0
      order_detail.save
     end
     cart_items.destroy_all
     redirect_to complete_orders_path
  else
    @order = Order.new(order_params)
    render :new
  end
 end

def complete
end

def index
 @orders = current_customer.orders.all
end

def show
 @order = Order.find(params[:id])
 @order_details = @order.order_details
end

  private
   def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :shipping_fee, :total_payment, :status)
   end

   def order_detail_params
    params.require(:order).permit(:item_id, :order_id, :amount_billed, :amount, :production_status)
   end

   def address_params
    params.require(:order).permit(:name, :address, :postal_code)
   end
end