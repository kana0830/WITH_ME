class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  
  attachment :image

  validates :name, presence: true, length: {minimum: 2, maximum: 10}
  validates :email, presence: true, uniqueness: true, length: {maximum: 50}
  validates :encrypted_password, presence: true
  validate :favorite_select

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :gelandes, through: :favorites
  has_many :schedules, dependent: :destroy

  # DM
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :rooms, through: :entries, dependent: :destroy

  # 通知
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visiter_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  # フォロー
  has_many :follower, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followed, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :following_user, through: :follower, source: :followed, dependent: :destroy
  has_many :follower_user, through: :followed, source: :follower, dependent: :destroy
  

  # ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーをアンフォローする
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしているかを確認する
  def following?(user)
    following_user.include?(user)
  end

  #フォロー通知
  def create_notification_follow(current_user)
    followed = Notification.where(visiter_id: current_user.id, visited_id: id, action: 'follow')
    if followed.blank?
      notification = current_user.active_notifications.new(visited_id: id, action: 'follow')
      notification.save if notification.valid?
    end
  end

  # ゲストログイン
  def self.guest
    find_or_create_by!(email: 'test@example.com', name: 'guest') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  # お気に入りゲレンデの選択3つまでのバリデーション
  def favorite_select
    if gelande_ids.count >= 4
      errors.add(:base, "お気に入りゲレンデを選択できるのは3つまでです。")
    end
  end


  enum gender: { 男性: 0, 女性: 1 }
  PREFECTURE = ["北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県",
    "茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県",
    "新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県",
    "静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県",
    "奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県",
    "徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県",
    "熊本県","大分県","宮崎県","鹿児島県","沖縄県"
  ];

end
