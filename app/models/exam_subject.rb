class ExamSubject < ApplicationRecord
  belongs_to :university_student
  belongs_to :subject
end
