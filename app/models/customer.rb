class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :cart_items
  has_many :orders

  # def full_name
  #  customer.last_name + " " + customer.first_name
  # end

  # def full_name_naka
  #  customer.last_name_kana + " " + customer.first_name_kana
  # end
end
