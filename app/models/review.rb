class Review < ApplicationRecord

  belongs_to :gelande

  validates :star, presence: true
  validates :title, presence: true
  validates :review, presence: true

end
