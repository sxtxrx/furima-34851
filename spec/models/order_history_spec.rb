require 'rails_helper'

RSpec.describe OrderHistory, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_history = FactoryBot.build(:order_history, user_id: user.id, item_id: item.id)
      sleep 0.1
    end
    context '商品購入がうまくいくとき' do
      it '全ての情報がが存在すれば登録できること' do
        expect(@order_history).to be_valid
      end
      it '建物名は空でも保存できること' do
        @order_history.building_name = ''
        expect(@order_history).to be_valid
      end
      
    end

    context '商品購入がうまくいかないとき' do
      it '郵便番号が空欄では登録できないこと' do
        @order_history.post_code = ''
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include('Post code is invalid')
      end
      it '郵便番号が半角数字以外は登録できないこと' do
        @order_history.post_code = '１２３−１２３４'
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include('Post code is invalid')
      end
      it '郵便番号はハイフンを含まないと登録できないこと' do
        @order_history.post_code = '1234567'
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include('Post code is invalid')
      end
      it '都道府県がないと登録できないこと' do
        @order_history.prefecture_id = 0
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村がないと登録できないこと' do
        @order_history.city = ''
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("City can't be blank")
      end
      it '番地が入力されないと登録できないこと' do
        @order_history.address = ''
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空欄では登録できないこと' do
        @order_history.phone_number = ''
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が11桁を超えると購入できないこと' do
        @order_history.phone_number = '09012345678910'
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it '電話番号は半角数字以外は登録できないこと' do
        @order_history.phone_number = 'abcdefghijk'
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @order_history.token = nil
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("Token can't be blank")
      end
      it 'item_idが空では登録できないこと' do
        @order_history.item_id = nil
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空では登録できないこと' do
        @order_history.user_id = nil
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
