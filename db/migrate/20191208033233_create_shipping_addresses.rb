class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.integer :customer_id
      t.string :shipping_zipcode
      t.string :shipping_address
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana

      t.timestamps
    end
  end
end
