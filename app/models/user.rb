class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  attachment :image
  acts_as_paranoid # パラノイアの論理削除

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
  validates :is_active, presence: true

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :gelandes, through: :favorites
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visiter_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  has_many :follower, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followed, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower
  

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
  def create_notification_follow!(current_user)
    temp = Notification.where(["visiter_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end

  # ゲストログイン
  def self.guest
    find_or_create_by!(email: 'test@example.com', name: 'guest') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  enum gender: { 男性: 0, 女性: 1 }
  PREFECTURE = {
    '北海道':1, '青森県':2, '岩手県':3,
    '宮城県':4, '秋田県':5, '山形県':6,
    '福島県':7, '茨城県':8, '栃木県':9,
    '群馬県':10, '埼玉県':11, '千葉県':12,
    '東京都':13, '神奈川県':14, '新潟県':15,
    '富山県':16, '石川県':17, '福井県':18,
    '山梨県':19, '長野県':20, '岐阜県':21,
    '静岡県':22, '愛知県':23, '三重県':24,
    '滋賀県':25, '京都府':26, '大阪府':27,
    '兵庫県':28, '奈良県':29, '和歌山県':30,
    '鳥取県':31, '島根県':32, '岡山県':33,
    '広島県':34, '山口県':35, '徳島県':36,
    '香川県':37, '愛媛県':38, '高知県':39,
    '福岡県':40, '佐賀県':41, '長崎県':42,
    '熊本県':43, '大分県':44, '宮崎県':45,
    '鹿児島県':46, '沖縄県':47
  }
end
