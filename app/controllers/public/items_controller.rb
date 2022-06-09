class Public::ItemsController < ApplicationController

  def index
   @items = Item.all
  end

  def show
   @item = Item.find(params[:id])
   @cart_items = CartItem.new
  end

private
  def item_params
   params.require(:item).permit(:name, :introduction, :price, :genre_id, :image)
  end

  def cart_item_params
   params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end
end
