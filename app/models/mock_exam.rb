# frozen_string_literal: true

class MockExam < ApplicationRecord
  validates :name, presence: true

  has_many :reviews, dependent: :destroy
end
