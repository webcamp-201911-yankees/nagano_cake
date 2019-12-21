class OrderHistory < ApplicationRecord

	enum payment_method: { credit: 1, bank: 2}
	has_many :order_details
	accepts_nested_attributes_for :order_details
	belongs_to :customer, -> {with_deleted} #論理削除された会員の注文を表示したいため
	enum order_status:[:入金待ち, :発送待ち, :発送済み]

	def make_order_details(carts)
      carts.each do |cart |
        order_detail = OrderDetail.new(
              product_id: cart.product_id,
              tax_included: cart.product.tax_include,
              number: cart.number,
              prepare_status: "製作待ち"
            )
        order_details << order_detail
      end
	end
  
end
