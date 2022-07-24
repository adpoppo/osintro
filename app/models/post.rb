class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_tag_relations, dependent: :destroy
  has_many :tags, through: :post_tag_relations
  has_many_attached :post_images

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
