class ShippingAddress < ApplicationRecord
	belongs_to :customer

	def full_address
		'〒' + shipping_zipcode + ' ' + shipping_address + ' '+ name
	end
end
