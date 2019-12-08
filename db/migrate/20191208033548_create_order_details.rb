class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :order_history_id
      t.integer :product_id
      t.integer :tax_included
      t.string :number
      t.integer :prepare_status

      t.timestamps
    end
  end
end
