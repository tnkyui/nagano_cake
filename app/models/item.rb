class Item < ApplicationRecord
  has_one_attached :image

  has_many :cart_items, dependent: :destroy
  has_many :orders_details, dependent: :destroy
  belongs_to :genre

  def add_tax_intenger
    (price * 1.1).floor
  end

  def add_tax_price
    add_tax_intenger.to_s(:delimited)
  end
end
