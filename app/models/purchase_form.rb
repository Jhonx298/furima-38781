class PurchaseForm
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address_num, :building_name, :phone_num, :token, :user_id, :product_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can`t be blank" }
    validates :city
    validates :address_num
    validates :phone_num, numericality: {with: /\A\d{10,11}\z/}
    validates :token
    validates :user_id
    validates :product_id
  end

  validates :building_name, exclusion: { in: [nil] }

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, product_id: product_id)
    ShippingInfo.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address_num: address_num,
                        building_name: building_name, phone_num: phone_num, purchase_record_id: purchase_record.id)
  end
end
