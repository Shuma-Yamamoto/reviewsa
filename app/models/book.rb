class Book < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :url, presence: true

  belongs_to :subject
  has_many :fix_books
  has_many :reviews
  has_many :favorite_books
end
