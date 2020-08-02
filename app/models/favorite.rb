class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :gelande

  validates :user_id, presence: true
  validates :gelande_id, presence: true

end
