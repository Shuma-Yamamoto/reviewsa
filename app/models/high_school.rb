# frozen_string_literal: true

class HighSchool < ApplicationRecord
  validates :name, presence: true

  belongs_to :prefecture
  has_many :university_students
end
