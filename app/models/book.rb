# frozen_string_literal: true

class Book < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :url, presence: true

  belongs_to :subject, optional: true
  has_many :fix_books
  has_many :reviews
  has_many :favorite_books
end
