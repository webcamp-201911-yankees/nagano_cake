class RemoveNamesFromOrderHistories < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_histories, :last_name, :string
    remove_column :order_histories, :last_name_kana, :string
    remove_column :order_histories, :first_name, :string
    remove_column :order_histories, :first_name_kana, :string
  end
end
