# frozen_string_literal: true

class Review < ApplicationRecord
  validates :begin_about, presence: true
  validates :finish_about, presence: true
  validates :pro, presence: true
  validates :con, presence: true
  validates :recommended_person, presence: true
  validates :recommended_usage, presence: true
  validates :evaluation, presence: true

  enum begin_about: { first: 0, second: 1, third: 2, ronin: 3 }, _prefix: true
  enum begin_season: { spring: 0, summer: 1, autumn: 2, winter: 3 }, _prefix: true
  enum finish_about: { first: 0, second: 1, third: 2, ronin: 3 }, _prefix: true
  enum finish_season: { spring: 0, summer: 1, autumn: 2, winter: 3 }, _prefix: true

  belongs_to :university_student
  belongs_to :book
  belongs_to :mock_exam, optional: true
  has_many :favorite_reviews, dependent: :destroy
end
