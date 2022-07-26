class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :amount, inclusion: { in: 1..10 }

  def subtotal_intenger
    item.add_tax_intenger * amount
  end

  def subtotal
    subtotal_intenger.to_s(:delimited)
  end
end
