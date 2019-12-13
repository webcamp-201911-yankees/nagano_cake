class Product < ApplicationRecord
	attachment :product_image
	belongs_to :category
	has_many :carts, dependent: :destroy
	has_many :order_details, dependent: :destroy
	validates :product_name, presence: true
	validates :caption, presence: true
	validates :tax_excluded, presence: true
	validates :sale_status, presence: true
	validates :category_id, presence: true
	enum sale_status:[:販売中, :販売停止中]

	def tax_include
		tax_excluded * 1.1
	end
end
