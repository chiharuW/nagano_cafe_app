class Admin::CustomersController < ApplicationController

  def index
   @customers = Customer.all
  end

  def show
   @customer = Customer.find(params[:id])
  end

  def edit
   @customer = Customer.find(params[:id])
  end

  def update
   customer = Customer.find(params[:id])
   customer.update(customer.params)
   redirect_to admin_customer_path(customer.id)
  end

private
 def customer_params
  params.request(:customer).permit(:full_name, :full_name_kana, :email, :postal_code, :address, :telephone_number)
 end
end

