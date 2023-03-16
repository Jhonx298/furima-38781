class Product < ApplicationRecord
  belongs_to :user
  has_one    :purchase_record
  has_one_attached :image
  

  validates :name,                presence: true
  validates :product_description, presence: true
  validates :price,               presence: true

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
