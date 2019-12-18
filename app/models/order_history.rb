class OrderHistory < ApplicationRecord

	enum payment_method: { credit: 1, bank: 2}
	has_many :order_details
	accepts_nested_attributes_for :order_details
	belongs_to :customer

	enum order_status:[:入金待ち, :入金済み, :発送済み]


end
