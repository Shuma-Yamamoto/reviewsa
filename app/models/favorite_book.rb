# frozen_string_literal: true

class FavoriteBook < ApplicationRecord
  belongs_to :examinee
  belongs_to :book
end
