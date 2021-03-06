class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |admin|
    admin.password = SecureRandom.urlsafe_base64
    # admin.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end

  
end
