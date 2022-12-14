# frozen_string_literal: true

class UnivMyPagesController < ApplicationController
  def show
    @page_student = UniversityStudent.eager_load(:university, :high_school,
                                                 exam_subjects: :subject, cram_histories: :cram_school,
                                                 reviews: :book).find(params[:id])
    @exam_sub = @page_student.exam_subjects
    @cram_hist = @page_student.cram_histories[0]
    @q = @page_student.reviews.ransack(params[:q])
    @reviews = @q.result(distinct: true).page(params[:page]).per(5)
  end
end
