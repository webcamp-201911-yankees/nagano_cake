class OrderHistory < ApplicationRecord

	enum payment_method:[['Credit',"1"],['Bank',"2"]]
	has_many :order_details, dependent: :destroy
	belongs_to :customer

end
