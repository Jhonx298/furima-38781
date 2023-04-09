require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @purchase = FactoryBot.build(:purchase_form, user_id: user.id, product_id: product.id)
  end
  describe '商品購入登録' do
    context '商品購入登録できるとき' do
      it 'post_code, prfecture_id, city, address_num, building_nameが正しく入力されていれば保存できること' do
        expect(@purchase).to be_valid  
      end
      it 'building_nameが空でも保存できること' do
        @purchase.building_name = ""
        expect(@purchase).to be_valid
      end
    end
    context '商品登録できない場合' do
      it 'post_codeが空だと保存できないこと' do
        @purchase.post_code = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase.post_code = "1234567"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchase.prefecture_id = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture can`t be blank")
      end
      it 'cityが空だと保存できないこと' do
        @purchase.city = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'address_numが空だと保存できないこと' do
        @purchase.address_num = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Address num can't be blank")
      end
      it 'phone_numが空だと保存できないこと' do
        @purchase.phone_num = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone num can't be blank")
      end
      it 'phone_numが11文字以上だと保存できないこと' do
        @purchase.phone_num = "1" * 12
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone num is too long (maximum is 11 characters)")
      end
      it 'phone_numが10文字以下だと保存できないこと' do
        @purchase.phone_num = 9
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone num is too short (minimum is 10 characters)")
      end
      it 'phone_numに半角数字以外が含まれている場合は保存できない' do
        @purchase.phone_num = "９"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone num is not a number")
      end
      it "tokenが空では登録できないこと" do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase.user_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User can't be blank")
      end
      it 'productが紐付いていないと保存できないこと' do
        @purchase.product_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
