require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user =FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに＠が存在しない場合登録できないこと' do
        @user.email = "abcdef.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordとpassword_confirmationが不一致の場合登録できないこと' do
        @user.password = "asd1234"
        @user.password_confirmation = "yyu3456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordnに半角数字が含まれていない場合は登録できないこと' do
        @user.password = "asdfghj"
        @user.password_confirmation = "asdfghj"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordに半角英語が含まれていないと登録できないこと' do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが全角では登録できないこと' do
        @user.password = "１２３asd"
        @user.password_confirmation = "１２３asd"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'family_nameが空だと登録できないこと' do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'first_nameが空だと登録できないこと' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'family_name_kanaが空だと登録できないこと' do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'family_name_kanaが漢字の場合だと登録できないこと' do
        @user.family_name_kana = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end

      it 'family_name_kanaがひらがなの場合だと登録できないこと' do
        @user.family_name_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end

      it 'family_name_kanaが英語の場合だと登録できないこと' do
        @user.family_name_kana = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end

      it 'family_name_kanaが数字の場合だと登録できないこと' do
        @user.family_name_kana = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end

      it 'first_name_kanaが空だと登録できないこと' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'first_name_kanaが漢字の場合だと登録できないこと' do
        @user.first_name_kana = "隆太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it 'first_name_kanaがひらがなの場合だと登録できないこと' do
        @user.first_name_kana = "りくたろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it 'first_name_kanaが英語の場合だと登録できないこと' do
        @user.first_name_kana = "rikutaro"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it 'first_name_kanaが数字の場合だと登録できないこと' do
        @user.first_name_kana = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      
      it 'birthdayが空だと登録できないこと' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'passwordが５文字以下だと登録できないこと' do
        @user.password = "asd12"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
    end

    context '新規登録できるとき' do
      it '全ての情報が正しく入力されていれば登録できること' do
        expect(@user).to be_valid
      end

      it 'passwordとpassword_confirmationが６文字以上であれば登録できること' do
        @user.password = "asd123"
        @user.password_confirmation = "asd123"
        expect(@user).to be_valid
      end

      it 'passwordに半角英数字が混在していれば登録できること' do
        @user.password = "asd1234"
        @user.password_confirmation = "asd1234"
        expect(@user).to be_valid
      end

      it "family_name_kanaにカタカナで入力されていれば登録できること" do
        @user.family_name_kana = "ヤマダ"
        expect(@user).to be_valid
      end

      it "first_name_kanaにカタカナで入力されていれば登録できること" do
        @user.first_name_kana = "リクタロウ"
        expect(@user).to be_valid
      end
    end
  end
end
