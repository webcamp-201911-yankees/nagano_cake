class Cart < ApplicationRecord
	belongs_to :customer
	belongs_to :product
	attachment :product_image
end
