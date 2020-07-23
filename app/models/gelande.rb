class Gelande < ApplicationRecord
  attachment :image

  has_many :reviews, dependent: :destroy

  validates :postal, presence: true, format: { with: /\A\d{7}\z/ }
  validates :address, presence: true
  validates :tel, presence: true
  validates :introduction, presence: true
  validates :name, presence: true, uniqueness: true
  validates :is_active, presence: true

  geocoded_by :address
  after_validation :geocode
end
