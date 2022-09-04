# frozen_string_literal: true

class FavoriteReview < ApplicationRecord
  belongs_to :examinee
  belongs_to :review
end
