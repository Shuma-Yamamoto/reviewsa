# frozen_string_literal: true

class FixBook < ApplicationRecord
  validates :detail, presence: true

  belongs_to :university_student
  belongs_to :book
end
