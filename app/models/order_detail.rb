class OrderDetail < ApplicationRecord
	belongs_to :product
	belongs_to :order_history
	enum account_status:{ 製作待ち: 0 ,製作中: 1, 製作完了: 2}
end
