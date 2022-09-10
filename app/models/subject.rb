# frozen_string_literal: true

class Subject < ApplicationRecord
  validates :name, presence: true

  has_many :books
  has_many :exam_subjects
  has_many :university_students, through: :exam_subjects
end
