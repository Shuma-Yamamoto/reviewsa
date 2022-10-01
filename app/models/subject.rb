# frozen_string_literal: true

class Subject < ApplicationRecord
  validates :name, presence: true

  has_many :books, dependent: :destroy
  has_many :exam_subjects, dependent: :destroy
  has_many :university_students, through: :exam_subjects, dependent: :destroy
end
