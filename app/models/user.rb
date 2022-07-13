class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :following, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_user, through: :following, source: :followed
  has_many :follower_user, through: :followed, source: :following
  has_many :favorites
  has_many :fav_posts, through: :favorites, source: :post

  def follow(user_id)
    following.create(followed_id: user_id)
  end

  def unfollow(user_id)
    following.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    following_user.include?(user)
  end

  validates :nickname, presence: true
  validates :password,
  format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Include both letters and numbers.' }

end
