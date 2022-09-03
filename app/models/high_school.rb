class HighSchool < ApplicationRecord
  validates :name, presence: true
  validates :url, presence: true

  belongs_to :prefecture
  has_many :university_students
end
