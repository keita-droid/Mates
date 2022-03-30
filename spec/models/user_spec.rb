require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#create" do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'name,email,passwordとpassword_confirmationが存在すれば登録できる' do
      expect(@user).to be_valid
    end
  end
end
