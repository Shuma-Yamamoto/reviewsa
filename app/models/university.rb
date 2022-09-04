# frozen_string_literal: true

class University < ApplicationRecord
  validates :name, presence: true
  validates :faculty, presence: true
  validates :domain, presence: true
  validates :url, presence: true

  has_many :university_students
end
