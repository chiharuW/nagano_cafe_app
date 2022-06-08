class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items = CartItem.all
    # @cart_item = 
    # @item = @cart_item.item
  end
  
  def create
   @cart_items = CartItem.new
  end
  
  
private  
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
