require 'rails_helper'

RSpec.describe User, type: :model do
    before do
     @user = FactoryBot.build(:user)
    end

  describe 'ユーザ登録' do
      context 'ユーザー登録できる場合'do
        it '必要な情報を適切に入力すると、新規登録ができること' do
          expect(@user).to be_valid
        end
      end

      context 'ユーザー登録できない場合' do
        it 'ニックネームが空だと保存できない'do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'メールアドレスが空だと保存できない' do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'メールアドレスが既に存在していると保存できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end

        it 'メールアドレスに＠がない場合保存できない' do
          @user.email = "kkkk.com"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end

        it 'パスワードが空だと保存できない' do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        
        it 'パスワード５文字だと保存できない' do
          @user.password = "12345"
          @user.password_confirmation = "12345"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it 'パスワードが全角では登録できない' do
          @user.password = "ａｂｃ１２３"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password Include both Letters and numbers")
        end

        it 'パスワードが半角英だけでは保存できない' do
          @user.password = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password Include both Letters and numbers")
        end

        it 'パスワードが半角数だけだと保存できない' do
          @user.password = "123456"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password Include both Letters and numbers")
        end

        it 'パスワード、確認用どちらかが空だと保存できない' do
          @user.password = "abc123"
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'パスワードと確認用が不一致だと保存できない' do
          @user.password = "123456"
          @user.password_confirmation = "1234567"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it '名字が空だと保存できない' do
          @user.last_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it '名字が全角でないと保存できない' do
          @user.last_name = "test"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name Full-width characters")
        end

        it '名字が全角ひらがなでないと保存きない' do
          @user.last_name = "ﾃｽﾄ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name Full-width characters")
        end

        it '名字が全角カタカナでないと保存できない' do
          @user.last_name = "ﾃｽﾄ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name Full-width characters")
        end

        it '名前が空だと保存できない' do
          @user.first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it '名前が全角でないと保存できない' do
          @user.first_name = "test"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name Full-width characters")
        end

        it '名前が全角ひらがなでないと保存できない' do
          @user.first_name = "ﾃｽﾄ"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name Full-width characters")
        end

        it '名前が全角カタカナでないと保存できない' do
          @user.first_name = "ﾃｽﾄ"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name Full-width characters")
        end

        it 'フリガナ名字は全カタカナでないと保存できない' do
          @user.last_kana = "ﾃｽﾄ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last kana Full-width katakana characters")
        end

        it 'フリガナ名前は全カタカナでないと保存できない' do
          @user.first_kana = "ﾃｽﾄ"
          @user.valid?
          expect(@user.errors.full_messages).to include("First kana Full-width katakana characters")
        end

        it '生年月日がないと保存できない' do
          @user.birthday = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
  end
end