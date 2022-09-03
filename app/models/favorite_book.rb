class FavoriteBook < ApplicationRecord
  belongs_to :examinee
  belongs_to :book
end
