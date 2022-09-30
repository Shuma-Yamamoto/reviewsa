# frozen_string_literal: true

class Book < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :url, presence: true

  belongs_to :subject, optional: true
  has_many :fix_books, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorite_books, dependent: :destroy
end
