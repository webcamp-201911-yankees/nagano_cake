class ChangeStatusOfCategories < ActiveRecord::Migration[5.2]
  def up
	change_column :categories, :status, :integer, default: 0
  end
  def down
	change_column :categories, :status, :integer
  end
end
