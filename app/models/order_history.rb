class OrderHistory < ApplicationRecord

	enum payment_method: { credit: 1, bank: 2}
	has_many :order_details, dependent: :destroy
	belongs_to :customer

	enum order_status:[:入金待ち, :発送待ち, :発送済み]


end
