class Gelande < ApplicationRecord
  attachment :image

  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  has_many :schedules, dependent: :destroy

  validates :postal, presence: true
  validates :address, presence: true
  validates :tel, presence: true
  validates :introduction, presence: true
  validates :name, presence: true, uniqueness: true

  geocoded_by :address
  after_validation :geocode

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      gelande = find_by(id: row["id"]) || new
      gelande.attributes = row.to_hash.slice(*updatable_attributes)
      gelande.save!
    end
  end
  
  def self.updatable_attributes
    ["id", "name", "count", "slope", "distance", "postal", "address", "tel", "hp", "introduction"]
  end

end
