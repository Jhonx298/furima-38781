class Product < ApplicationRecord
  belongs_to :user
  has_one    :purchase_record
  has_one_attached :image

  validates :name,                presence: true
  validates :product_description, presence: true
  validates :price,               presence: true
end
