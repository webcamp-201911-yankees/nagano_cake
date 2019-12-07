class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :name
      t.text :caption
      t.integer :tex_excluded
      t.string :product_image
      t.integer :sale_status

      t.timestamps
    end
  end
end
