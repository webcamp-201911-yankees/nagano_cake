class AddNameToOrderHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :order_histories, :name, :string
  end
end
