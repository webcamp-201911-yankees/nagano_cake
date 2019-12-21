class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shipping_addresses
  has_many :carts
  has_many :order_histories

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :zipcode, format: {with: /\A[0-9]{7}\z/} #7桁の数字のみ有効
  validates :address, presence: true
  validates :phone_number, presence: true

  enum account_status:{ 有効: 0, 無効: 1}

  def toggle_status
    if account_status == "有効"
       account_status = 1
    else
       account_status = 0
    end
  end

  acts_as_paranoid #paranoia

end
