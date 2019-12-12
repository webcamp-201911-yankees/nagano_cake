class Category < ApplicationRecord
	has_many :products, dependent: :destroy
	validates :name, presence: true
	enum status: { 無効: 0, 有効: 1}

	def toggle_status
		if status == "有効"
			status = 0
		else
			status = 1
		end
	end
end
