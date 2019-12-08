class RenameProductImageColumnToProducts < ActiveRecord::Migration[5.2]
  def change
  	rename_column :products, :product_image, :product_image_id
  end
end
