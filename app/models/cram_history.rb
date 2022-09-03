class CramHistory < ApplicationRecord
  validates :join_at, presence: true
  validates :leave_at, presence: true

  belongs_to :university_student
  belongs_to :cram_school
end
