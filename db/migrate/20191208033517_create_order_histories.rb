class CreateOrderHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :order_histories do |t|
      t.integer :customer_id
      t.integer :payment_method
      t.integer :order_status
      t.string :zipcode
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.string :address
      t.integer :shipping_fee
      t.integer :total_price

      t.timestamps
    end
  end
end
