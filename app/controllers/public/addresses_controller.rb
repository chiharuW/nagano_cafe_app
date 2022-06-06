class Public::AddressesController < ApplicationController

  def index
   @addresses = current_customer.addresses
  end

  def create
   @address = Address.new
   @address.save
   redirect_to addresses_path
  end

 private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end