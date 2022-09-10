# frozen_string_literal: true

class UniversityStudent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :entrance_at, presence: true
  validates :ronin, presence: true
  validates :anonymous_high_school, inclusion: {in: [true, false]}
  validates :subject_ids, presence: true

  belongs_to :university
  belongs_to :high_school
  has_many :fix_books
  has_many :reviews

  has_many :cram_histories
  accepts_nested_attributes_for :cram_histories

  has_many :exam_subjects
  has_many :subjects, through: :exam_subjects
  accepts_nested_attributes_for :exam_subjects
end
