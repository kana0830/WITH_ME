class Gelande < ApplicationRecord
  attachment :image

  validates :postal, presence: true
  validates :address, presence: true
  validates :tel, presence: true
  validates :introduction, presence: true
  validates :name, presence: true, uniqueness: true
  validates :is_active, presence: true
end
