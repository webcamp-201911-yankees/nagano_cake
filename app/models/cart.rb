class Cart < ApplicationRecord
	belongs_to :customer
	belongs_to :product

    def get_product
	  Product.find(self.product_id)
	end
end
