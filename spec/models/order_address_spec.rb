require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it 'トークンと配送先情報があれば購入できる' do
        expect(@order_address).to be_valid
      end
    end

    context '商品を購入できないとき' do
      it '郵便番号が入ってないとき' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがないとき' do
        @order_address.postal_code = '9990000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号の数字が少ないとき' do
        @order_address.postal_code = '999'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が入ってないとき' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が入ってないとき' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が入ってないとき' do
        @order_address.add_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Add number can't be blank")
      end
      it '電話番号が入ってないとき' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

    end
  end
end
