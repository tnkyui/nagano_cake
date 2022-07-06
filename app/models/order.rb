class Order < ApplicationRecord
  belongs_to :customer
  has_many :orders_details, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting: 0, confirmation: 1, maiking: 2, ready: 3, complete: 4 }
end
