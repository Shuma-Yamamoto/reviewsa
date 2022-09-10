# frozen_string_literal: true

class CramHistory < ApplicationRecord
  belongs_to :university_student
  belongs_to :cram_school
end
