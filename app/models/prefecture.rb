class Prefecture < ApplicationRecord
  validates :name, presence: true

  has_many :high_schools
end
