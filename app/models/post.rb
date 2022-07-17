class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :post_image

  with_options presence: true do
    validates :post_image
    validates :title, length: {maximum: 40}
    validates :content, length: {maximum: 1000}
  end
  validates :category_id, numericality: { other_than: 0, message: "can't be blank" }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
