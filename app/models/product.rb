class Product < ApplicationRecord
	attachment :product_image

	belongs_to :category

	has_many :carts, dependent: :destroy
	has_many :order_details, dependent: :destroy

	enum sale_status:[:販売中, :販売停止中]
end
