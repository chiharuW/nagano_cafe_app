class Public::CustomersController < ApplicationController

  def my_page
  end

  def unsubscribe
   @customer=current_customer
  end

  def withdraw
   @customer = current_customer
   @customer.update(is_deleted: true) #ここでis_deletedカラムの値をtrueに更新します。
   reset_session #この記述で現在のログイン状況をリセットすることができます。
   flash[:notice] = "退会が完了しました。" #フラッシュメッセージがあると親切ですね！
   redirect_to root_path #処理完了後ルートパスへ遷移します。
  end


  def edit_page
   @customer = current_customer
  end

  def update
   customer = current_customer
   customer.update(customer_params)
   redirect_to my_page_customers_path
  end


private
  def customer_params
   params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number,  :is_deleted)
  end

  def ensure_correct_customer
   @customer = Customer.find(params[:id])
   redirect_to(customer_path(current_customer.id)) unless @customer == current_customer
  end

end