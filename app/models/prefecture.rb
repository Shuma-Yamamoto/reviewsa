# frozen_string_literal: true

class Prefecture < ApplicationRecord
  validates :name, presence: true

  has_many :high_schools, dependent: :destroy
end
