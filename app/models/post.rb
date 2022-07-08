class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  has_one_attached :post_image

  with_options presence: true do
    validates :title, length: {maximum: 40}
    validates :content, length: {maximum: 1000}
  end

  validates :category_id, numericality: { other_than: 0, message: "can't be blank" }

end
