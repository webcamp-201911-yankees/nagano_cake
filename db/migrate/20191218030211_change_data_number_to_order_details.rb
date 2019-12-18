class ChangeDataNumberToOrderDetails < ActiveRecord::Migration[5.2]
  def change
  	change_column :order_details, :number, :integer
  end
end
