# frozen_string_literal: true

class Examinee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :grade, presence: true

  enum grade: { first: 0, second: 1, third: 2, ronin: 3 }, _prefix: true

  has_many :favorite_reviews
  has_many :favorite_books
end
