require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
   context '新規登録がうまくいくとき' do

    it 'nameとemail、passwordとpassword_confirmation,first_name ,first_name_kana,family_name,family_name_kana,birthdayが存在すれば登録できること' do
      expect(@user).to be_valid
    end
   
    end
   
   context '新規登録がうまくいかないとき' do

    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "password６文字以上でないと登録できないこと" do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
    it "password英語のみでは登録できないこと" do
        @user.password = "abcdefg"
        @user.password_confirmation = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
        end
    it "password数字のみでは登録できないこと" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
    it "password全角では登録できないこと" do
      @user.password = '１２３４５６'
      @user.password_confirmation = '１２３４５６'
      @user.valid?   
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it '名前が空では登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it '名前は漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.first_name = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it '名前のふりがながカタカナ以外では登録できないこと' do
      @user.first_name_kana = 'かな'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "名前のふりがなが全角文字以外では登録できないこと" do
        @user.first_name = "ｶﾅ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "名前のふりがなが全角文字であってもカタカナ以外では登録できないこと" do
      @user.first_name_kana = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      

    

    it '名字が空では登録できないこと' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it '名字のふりがなが空では登録できないこと' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.family_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      
        it "名字のふりがなが全角文字であってもカタカナ以外では登録できないこと" do
          @user.family_name_kana = "かな"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana is invalid")
          end
        

    it 'birthdayが空では登録できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
   end 
  end
end
