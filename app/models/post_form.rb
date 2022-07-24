class PostForm
  include ActiveModel::Model

  attr_accessor(
    :post_images, :title, :content, :category_id, :link, :user_id, :id,
    :created_at, :datetime, :updated_at, :datetime, :tag_name
  )

  validates :post_images, length: { minimum: 1, maximum: 4, message: "は1枚〜4枚添付してください" }
  with_options presence: true do
    validates :title, length: {maximum: 40}
    validates :content, length: {maximum: 1000}
  end
  validates :category_id, numericality: { other_than: 0, message: "を選択してください" }

  def save
    post = Post.create(post_images: post_images, title: title, content: content, category_id: category_id, link: link, user_id: user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    PostTagRelation.create(post_id: post.id, tag_id: tag.id)
  end

  def update(params, post)
    post.post_tag_relations.destroy_all
    tag_name = params.delete(:tag_name)
    tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?
    tag.save if tag_name.present?
    post.update(params)
    PostTagRelation.create(post_id: post.id, tag_id: tag.id) if tag_name.present?
  end

end