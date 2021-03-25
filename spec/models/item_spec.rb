require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '商品出品がうまくいくとき' do
      it '画像、商品名、商品の説明、カテゴリー、商品の状態、配送料、発送元、発送までの日数、販売価格の情報が存在すれば登録できること' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかない時' do
      it '画像がないと登録できないこと' do
        @item.image = nil
        expect(@item).to be_valid
      end
      it '商品名がないと登録できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'カテゴリーを入力しないと登録できないこと' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '発送料の情報を入力しないと登録できないこと' do
        @item.ship_cost = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship cost can't be blank")
      end
      it '発送日数の情報を入力しないと登録できないこと' do
        @item.ship_day = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship day can't be blank")
      end
      it '発送元の情報を入力しないと登録できないこと' do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'category_idが0の場合出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'ship_cost_idが0の場合出品できない' do
        @item.ship_cost_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship cost can't be blank")
      end
      it 'ship_day_idが0の場合出品できない' do
        @item.ship_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship day can't be blank")
      end

      it 'prefecture_idが0の場合出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '価格が300~9,999,999の間でないと登録できないこと' do
        @item.price = 299 && 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it '価格は半角数字以外だと登録できないこと' do
        @item.price = 'price'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it '価格は全角文字だと登録できないこと' do
        @item.price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it '価格は半角英数混合だと登録できないこと' do
        @item.price = 'price123'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
    end
  end
end
