require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント送信' do
    context 'コメント送信できる場合' do
      it 'textが存在すれば登録できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメント送信できない場合' do
      it 'textが空では登録できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it 'textが600文字より多いと登録できない' do
        @comment.text = Faker::Internet.password(min_length: 601)
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Text is too long (maximum is 600 characters)')
      end
      it 'userが紐づいていないと登録できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
      it 'postが紐づいていないと登録できない' do
        @comment.post = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Post must exist")
      end
    end
  end
end
