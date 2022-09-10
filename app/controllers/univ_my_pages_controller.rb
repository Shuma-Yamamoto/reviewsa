class UnivMyPagesController < ApplicationController
  before_action :authenticate_any!, only: :show

  def show
    @univ = UniversityStudent.find(params[:id])
    @exam = ExamSubject.where(university_student_id: @univ.id)
    @cram = CramHistory.find_by(university_student_id: @univ.id)
    @q = @univ.reviews.ransack(params[:q])
    @reviews = @q.result(distinct: true).page(params[:page]).per(3)
  end
end
