class PurchaseRecord < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one    :shipping_info
end
