class OrderDetail < ApplicationRecord
	belongs_to :product
	belongs_to :order_history
end
