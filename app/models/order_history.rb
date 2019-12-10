class OrderHistory < ApplicationRecord

	enum payment_method:[['Credit',"1"],['Bank',"2"]]

	belongs_to :customer
	has_many :order_details, dependent: :destroy

end
