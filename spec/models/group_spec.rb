require 'rails_helper'

RSpec.describe Group, type: :model do
  describe "#create" do
    before do
      @group = FactoryBot.build(:group)
    end

    it 'name, description, publicが存在すれば作成できる' do
      expect(@group).to be_valid
    end

    it 'nameさえ存在すれば作成できる' do
      @group.description = ""
      @group.public = nil
      expect(@group).to be_valid
    end

    it 'nameが存在しないと作成できない' do
      @group.name = ""
      @group.valid?
      expect(@group.errors.full_messages).to include("名前を入力してください。")
    end
  end
end
