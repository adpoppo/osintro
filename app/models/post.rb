class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many_attached :post_images

  validates :post_images, length: { minimum: 1, maximum: 4, message: "は1枚〜4枚添付してください" }
  with_options presence: true do
    validates :title, length: {maximum: 40}
    validates :content, length: {maximum: 1000}
  end
  validates :category_id, numericality: { other_than: 0, message: "を入力してください" }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
