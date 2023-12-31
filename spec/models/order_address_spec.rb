require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it '全ての項目が入力されていれば購入できる' do
        expect(@order_address).to be_valid
      end
      it '建物名が空でも購入できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
      it 'user_idが空でなければ購入できる' do
        @order_address.user_id = '1'
        @order_address.valid?
      end
      it 'item_idが空でなければ購入できる' do
        @order_address.item_id = '1'
        @order_address.valid?
      end
      it '都道府県が「---」ではなく、かつ空でなければ購入できる' do
        @order_address.prefecture_id = '2'
        @order_address.valid?
      end
      it '郵便番号が「「3桁＋ハイフン＋4桁」の組み合わせであれば購入できる' do
        @order_address.postal_code = '222-7777'
        @order_address.valid?
      end
      it '市区町村が空でなければ購入できる' do
        @order_address.city = '山形市'
        @order_address.valid?
      end
      it '番地名が空でなければ購入できる' do
        @order_address.add_number = '城南区22-2'
        @order_address.valid?
      end
      it '電話番号が空でなく、10か11桁ならば購入できる' do
        @order_address.phone_number = '11111111111'
        @order_address.valid?
      end
    end

    context '商品を購入できないとき' do
      it 'tokenが空では購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が半角ハイフンを含む形でなければ購入できない' do
        @order_address.postal_code = '9990000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '郵便番号の数字が少ないと購入できない' do
        @order_address.postal_code = '999'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県が入ってないと購入できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県に「---」が選択されている場合は購入できない' do
        @order_address.prefecture_id = ' 1 '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空では購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では購入できない' do
        @order_address.add_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Add number can't be blank")
      end
      it '電話番号が空では購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁以下では購入できない' do
        @order_address.phone_number = '0901234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid.')
      end
      it '電話番号が12桁以上では購入できない' do
        @order_address.phone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid.')
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @order_address.phone_number = '0900000999９'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'userが紐付いていなければ購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
