class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
  enum making_status: { impossible: 0, wating: 1, maiking: 2, complete: 3 }
end
