class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :gelande

  validates :title, presence: true

end
