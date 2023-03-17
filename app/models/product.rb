class Product < ApplicationRecord
  belongs_to :user
  has_one    :purchase_record
  has_one_attached :image
  
  validates :image,               presence: true
  validates :name,                presence: true, length: { maximum: 40}
  validates :product_description, presence: true, length: { maximum: 1000}
  validates :price,               presence: true, numericality: { in: 300..9999999 }

  validates :category_id,        numericality: { other_than: 1, message: "can`t be blank" }
  validates :condition_id,       numericality: { other_than: 1, message: "can`t be blank" }
  validates :shipping_charge_id, numericality: { other_than: 1, message: "can`t be blank" }
  validates :prefecture_id,      numericality: { other_than: 1, message: "can`t be blank" }
  validates :days_ship_id,       numericality: { other_than: 1, message: "can`t be blank" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_ship
end
