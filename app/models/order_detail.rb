class OrderDetail < ApplicationRecord
  belongs_to :customer
  belongs_to :order
  
  enum production_status: { not_possible: 0, pending: 1, in_production: 2, complete: 3 }
end
