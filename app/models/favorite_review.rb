class FavoriteReview < ApplicationRecord
  belongs_to :examinee
  belongs_to :review
end
