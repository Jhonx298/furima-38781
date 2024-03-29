class CreateShippingInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_infos do |t|
      t.string     :post_code,       null: false
      t.integer    :prefecture_id,   null: false
      t.string     :city,            null: false
      t.string     :address_num,     null: false
      t.string     :building_name
      t.string     :phone_num,       null: false
      t.references :purchase_record, null: false, foreign_key: true
      t.timestamps
    end
  end
end
