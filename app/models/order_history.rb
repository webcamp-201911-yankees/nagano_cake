class OrderHistory < ApplicationRecord

	enum payment_method:[['Credit',"1"],['Bank',"2"]]
	has_many :order_details
	belongs_to :customer

	enum order_status:[:入金待ち, :発送待ち, :発送済み]

end
