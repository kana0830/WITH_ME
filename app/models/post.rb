class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  acts_as_taggable # タグ

  validates :title, presence: true
  validates :post, presence: true

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

end
