class ChangeAccountStatusOfCustomers < ActiveRecord::Migration[5.2]
  def up
	change_column :customers, :account_status, :integer, default: 0
  end
  def down
	change_column :customers, :account_status, :string
  end
end
