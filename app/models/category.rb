class Category < ApplicationRecord
	has_many :products
	validates :name, presence: true, uniqueness: true
	enum status: { 無効: 0, 有効: 1} #enumの記述方式

# toggle_statusメソッドを定義(admin_categoryのcontrollerで使用)
	def toggle_status
		if status == "有効"
			status = 0
		else
			status = 1
		end
	end
end
