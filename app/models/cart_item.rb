class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def subtotal_intenger
    item.add_tax_intenger * amount
  end

  def subtotal
    subtotal_intenger.to_s(:delimited)
  end
end
