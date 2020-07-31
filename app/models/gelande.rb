class Gelande < ApplicationRecord
  attachment :image

  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  validates :postal, presence: true, format: { with: /\A\d{7}\z/ }
  validates :address, presence: true
  validates :tel, presence: true, format: { with: /\A[0-9]+\z/ }
  validates :introduction, presence: true
  validates :name, presence: true, uniqueness: true

  geocoded_by :address
  after_validation :geocode
end
