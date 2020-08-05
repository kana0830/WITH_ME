class Message < ApplicationRecord

  belongs_to :user
  belongs_to :room
  
  validates :content, presence: true

  # メッセージ通知
  # def create_notification_message(current_user, visited_id)
  #   notification = current_user.active_notifications.new(message_id: id, visiter_id: current_user.id, visited_id: visited_id, action: 'message')
  #   if notification.visiter_id == notification.visited_id
  #     notification.checked = true
  #   end
  #   notification.save if notification.valid?
  # end
end
