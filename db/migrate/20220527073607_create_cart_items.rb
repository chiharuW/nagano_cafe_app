class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :item,     foreign_key: true, null: false
      t.integer :customer, foreign_key: true, null: false
      t.integer :amount, null: false
      
      t.timestamps
    end
  end
end
