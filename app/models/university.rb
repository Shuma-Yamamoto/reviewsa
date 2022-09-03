class University < ApplicationRecord
  validates :name, presence: true
  validates :faculty, presence: true
  validates :score, presence: true
  validates :email, presence: true
  validates :url, presence: true

  has_many :university_students
end
