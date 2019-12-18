class Product < ApplicationRecord
	attachment :product_image
	belongs_to :category
	has_many :carts, dependent: :destroy
	has_many :order_details, dependent: :destroy
	has_many :order_histories, :through => :order_details
	validates :product_name, presence: true, uniqueness: true
	validates :caption, presence: true
	validates :tax_excluded, presence: true
	validates :sale_status, presence: true
	validates :category_id, presence: true
	enum sale_status:[:販売中, :販売停止中]

	def tax_include
		self.tax_excluded * 1.1
	end
end


