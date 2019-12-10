class RemoveNamesFromShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :shipping_addresses, :last_name, :string
    remove_column :shipping_addresses, :last_name_kana, :string
    remove_column :shipping_addresses, :first_name, :string
    remove_column :shipping_addresses, :first_name_kana, :string
  end
end
