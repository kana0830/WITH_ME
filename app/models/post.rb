class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :notifications, dependent: :destroy

  acts_as_taggable # タグ

  validates :title, presence: true
  validates :post, presence: true

  # 既にいいねしてるかどうか確認
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  # いいね通知
  def create_notification_like(current_user)
    liked = Notification.where(visiter_id: current_user.id, visited_id: user_id, post_id: id, action: 'like')
    if liked.blank?
      notification = current_user.active_notifications.new(post_id: id, visited_id: user_id, action: 'like')
      if notification.visiter_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  # コメント通知
  def create_notification_comment(current_user, comment_id)
    commented_ids = Comment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
    commented_ids.each do |commented_id|
      save_notification_comment(current_user, comment_id, commented_id['user_id'])
    end
    save_notification_comment(current_user, comment_id, user_id) if commented_ids.blank?
  end

  def save_notification_comment(current_user, comment_id, visited_id)
    notification = current_user.active_notifications.new(post_id: id, comment_id: comment_id, visited_id: visited_id, action: 'comment')
    if notification.visiter_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

end
