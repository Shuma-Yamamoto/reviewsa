class Subject < ApplicationRecord
  validates :name, presence: true

  has_many :exam_subjects
  has_many :books
end
