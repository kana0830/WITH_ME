class Review < ApplicationRecord

  belongs_to :gelande

  validates :star, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
  validates :title, presence: true
  validates :review, presence: true

end
