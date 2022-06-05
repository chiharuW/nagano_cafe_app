class Public::CustomersController < ApplicationController
 
  def my_page
  end
  
  def edit
   @customer = Customer.find(params[:id])
  end

  def update
   customer = Customer.find(params[:id])
   customer.update(customer.params)
   redirect_to my_page_customers_path
  end


private
  def customer_params
   params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active)
  end

  def ensure_correct_customer
   @customer = Customer.find(params[:id])
   redirect_to(customer_path(current_customer.id)) unless @customer == current_customer
  end

end