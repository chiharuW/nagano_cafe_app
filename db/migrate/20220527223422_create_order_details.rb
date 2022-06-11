class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :item_id,     foreign_key: true, null: false
      t.integer :customer_id, foreign_key: true, null: false      
      t.string  :amount_billed,     null: false
      t.integer :amount,            null: false
      t.integer :production_active, null: false
      
      t.timestamps
    end
  end
end
