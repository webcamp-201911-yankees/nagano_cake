class Product < ApplicationRecord
	attachment :product_image
	has_many :carts, dependent: :destroy
	has_many :order_details, dependent: :destroy

	def tax_include
		tax_excluded * 1.1
	end
end
