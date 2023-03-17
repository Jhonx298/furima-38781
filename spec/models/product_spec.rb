require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品登録' do
    context '商品出品登録できる場合' do
      it "name,product_description,category_id,condition_id,shipping_charge_id,
          prefecture_id,days_ship_id,priceが存在すれば登録できる" do
        expect(@product).to be_valid
      end
    end
    context '商品出品登録できない場合' do
      it "imageが空では登録できない" do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空では登録できない" do
        @product.name = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it "product_descriptionが空では登録できない" do
        @product.product_description = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Product description can't be blank")
      end
      it "category_idが空では登録できない" do
        @product.category_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can`t be blank")
      end
      it "condition_idが空では登録できない" do
        @product.condition_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can`t be blank")
      end
      it "shipping_charge_idが空では登録できない" do
        @product.shipping_charge_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping charge can`t be blank")
      end
      it "prefecture_idが空では登録できない" do
        @product.prefecture_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can`t be blank")
      end
      it "days_ship_idが空では登録できない" do
        @product.days_ship_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Days ship can`t be blank")
      end
      it "priceが空では登録できない" do
        @product.price= ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it "category_idが「---」では登録できない" do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can`t be blank")
      end
      it "condition_idが「---」では登録できない" do
        @product.condition_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can`t be blank")
      end
      it "shipping_charge_idが「---」では登録できない" do
        @product.shipping_charge_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping charge can`t be blank")
      end
      it "prefecture_idが「---」では登録できない" do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can`t be blank")
      end
      it "days_ship_idが「---」では登録できない" do
        @product.days_ship_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Days ship can`t be blank")
      end
      it "nameが40文字以上では登録できない" do
        @product.name = "a" * 41
        @product.valid?
        expect(@product.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it "product_descriptionが1000文字以上では登録できない" do
        @product.product_description = "a" * 1001
        @product.valid?
        expect(@product.errors.full_messages).to include("Product description is too long (maximum is 1000 characters)")
      end
    end
  end
end
