# frozen_string_literal: true

class University < ApplicationRecord
  validates :name, presence: true
  validates :faculty, presence: true
  validates :domain, presence: true
  validates :url, presence: true

  has_many :university_students, dependent: :destroy

  def full_name
    if self.department.nil?
      self.name + " " + self.faculty + "学部"
    else
      self.name + " " + self.faculty + "学部 " + self.department + "学科"
    end
  end
end
