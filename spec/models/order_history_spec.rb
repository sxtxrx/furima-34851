require 'rails_helper'

RSpec.describe OrderHistory, type: :model do
  describe '#create' do
    before do
      @order_history = FactoryBot.build(:order_history)

    end
    context '商品購入がうまくいくとき' do
      it '郵便番号、都道府県、市町村、番地、電話番号が存在すれば登録できること' do
        expect(@order_history).to be_valid
      end
      it '建物名は空でも保存できること' do
        expect(@order_history).to be_valid
      end
      it "priceとtokenがあれば保存ができること" do
        expect(@order_history).to be_valid
      end
      
    end

    context '商品購入がうまくいかないとき' do
      it '郵便番号が空欄では登録できないこと' do
        @order_history.post_code = ''
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("Post code is invalid")
      end
      it '郵便番号が半角数字以外は登録できないこと' do
        @order_history.post_code = '１２３−１２３４'
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("Post code is invalid")
      end
      it '郵便番号はハイフンを含まないと登録できないこと' do
        @order_history.post_code = '-'
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("Post code is invalid")
      end
      it '都道府県がないと登録できないこと' do
        @order_history.prefecture_id= nil
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
        expect(@order_history.errors.full_messages).to include("Phone number is not a number")
      end
      it '電話番号は半角数字以外は登録できないこと' do
        @order_history.phone_number = 'abcdefghijk'
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("Phone number is not a number")
      end
      it "tokenが空では登録できないこと" do
        @order_history.token = nil
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("Token can't be blank")
      end
      
    end
  end

end
