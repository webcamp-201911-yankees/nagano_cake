class Category < ApplicationRecord
	has_many :products, dependent: :destroy
	enum status: { good: 0, bad: 1}

	def toggle_status!
		if good?
			bad!
		else
			good!
		end
	end
end
