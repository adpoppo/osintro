require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
    sleep 0.1
  end

  describe '新規投稿' do
    context '新規投稿できる場合' do
      it 'post_image、title、content、categoryが存在すれば登録できる' do
        expect(@post).to be_valid
      end
      it 'linkが空でも登録できる' do
        @post.link = ''
        @post.valid?
        expect(@post).to be_valid
      end
      it 'tagが空でも登録できる' do
        @post.tag = ''
        @post.valid?
        expect(@post).to be_valid
      end
    end

    context '新規投稿できない場合' do
      it 'post_imageが空では登録出来ない' do
        @post.post_image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Post image can't be blank")
      end
      it 'titleが空では登録出来ない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end
      it 'titleが40文字以上では登録できない' do
        @post.title = Faker::Lorem.characters(number: 41)
        @post.valid?
        expect(@post.errors.full_messages).to include('Title is too long (maximum is 40 characters)')
      end
      it 'contentが空では登録出来ない' do
        @post.content = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Content can't be blank")
      end
      it 'contentが1000文字以上では登録できない' do
        @post.content = Faker::Internet.password(min_length: 1001)
        @post.valid?
        expect(@post.errors.full_messages).to include('Content is too long (maximum is 1000 characters)')
      end
      it 'category_idが0では登録出来ない' do
        @post.category_id = 0
        @post.valid?
        expect(@post.errors.full_messages).to include("Category can't be blank")
      end
    end
  end
end
