class UnivMyPagesController < ApplicationController
  # before_action :correct_my_page

  def show
    @univ = UniversityStudent.find(params[:id])
    @exam = ExamSubject.where(university_student_id: @univ.id)
    @cram = CramHistory.find_by(university_student_id: @univ.id)
    @q = @univ.reviews.ransack(params[:q])
    @reviews = @q.result(distinct: true).page(params[:page]).per(5)
  end

  # private
  # def correct_my_page
  #   @univ = UniversityStudent.find(params[:id])
  #   unless @univ.id == current_university_student.id
  #     redirect_to subjects_path
  #   end
  # end
end
