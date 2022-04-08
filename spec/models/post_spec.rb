require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "#create" do
    before do
      @post = FactoryBot.build(:post)
    end

    it 'text, user_id, genre_idが存在すれば作成できる' do
      expect(@post).to be_valid
    end

    it 'textが存在しないと作成できない' do
      @post.text = ""
      @post.valid?
      expect(@post.errors.full_messages).to include("Textを入力してください。")
    end
  end
end
