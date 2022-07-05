class Order < ApplicationRecord
  belongs_to :customer
  has_many :orders_details, dependent: :destroy
end
