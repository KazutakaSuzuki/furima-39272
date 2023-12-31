require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品を出品できる' do
      it '必要項目を全て入力済みである' do
        expect(@item).to be_valid
      end
    end

    context '商品を出品できない' do
      it '商品画像が必須である' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須である' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品名が40文字以上では出品できない' do
        @item.item_name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include('Item name is too long (maximum is 40 characters)')
      end
      it '商品の説明が必須である' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it '商品の説明が1,000文字以上では出品できない' do
        @item.explain = 'a' * 1001
        @item.save
        @item.valid?
        expect(@item.errors.full_messages).to include('Explain is too long (maximum is 1000 characters)')
      end
      it 'カテゴリーの情報が必須である' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の情報が必須である' do
        @item.quality_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality can't be blank")
      end
      it '配送料の負担の情報が必須である' do
        @item.fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee status can't be blank")
      end
      it '発送元の地域の情報が必須である' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数の情報が必須である' do
        @item.schedule_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Schedule can't be blank")
      end
      it '価格の情報が必須である' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の情報が設定値以下である' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it '価格の情報が設定値以上である' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it '価格の情報が半角数字以外で入力されている' do
        @item.price = '　１００００　'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters')
      end

      it 'userが紐づいていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'カテゴリーに「1」が選択されている場合は出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態に「1」が選択されている場合は出品できない' do
        @item.quality_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality can't be blank")
      end
      it '配送料の負担に「1」が選択されている場合は出品できない' do
        @item.fee_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee status can't be blank")
      end
      it '発送元の地域に「1」が選択されている場合は出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数に「1」が選択されている場合は出品できない' do
        @item.schedule_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Schedule can't be blank")
      end
    end
  end
end
