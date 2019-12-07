class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    	t.text :product_image
    	t.string :product_name
    	t.text :caption
    	t.integer :category_id
    	t.integer :tax_excluded
    	t.string :sale_status

      t.timestamps
    end
  end
end
