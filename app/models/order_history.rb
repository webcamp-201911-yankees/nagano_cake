class OrderHistory < ApplicationRecord
	enum payment_method:[['Credit',"1"],['Bank',"2"]]
end
