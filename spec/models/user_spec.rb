require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#create" do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'name,email,passwordとpassword_confirmationが存在すれば登録できる' do
      expect(@user).to be_valid
    end

    it 'nameが空では登録できない' do
      @user.name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください。")
    end

    it 'emailが空では登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスを入力してください。")
    end

    it 'passwordが空では登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください。")
    end

    it 'passwordが6文字以上であれば登録できる' do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user).to be_valid
    end
    
    it 'passwordが5文字以下であれば登録できない' do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください。")
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = "12345678"
      @user.valid?
      expect(@user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません。")
    end

    it '重複するemailが存在する場合は登録できない' do
      user = FactoryBot.create(:user)
      @user.email = user.email
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスはすでに存在します。")
    end
  end
end
