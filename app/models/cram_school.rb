# frozen_string_literal: true

class CramSchool < ApplicationRecord
  validates :name, presence: true

  has_many :cram_histories
end
