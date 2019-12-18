class OrderDetail < ApplicationRecord
	belongs_to :product
	belongs_to :order_history
	enum prepare_status:[:製作待ち, :製作中, :製作完了]
end
