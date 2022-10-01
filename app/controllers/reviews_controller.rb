# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_university_student!, only: %i[new create edit update destroy]
  before_action :up_to_one, only: :new
  before_action :correct_review, only: :edit

  def show
    @review = Review.eager_load(:book, :mock_exam, university_student:
      [:university, :high_school, { exam_subjects: :subject }, { cram_histories: :cram_school }]).find(params[:id])
    @page_student = @review.university_student
    @exam_sub = @page_student.exam_subjects
    @cram_hist = @page_student.cram_histories[0]
  end

  def new
    @review = Review.new
    @book = Book.find(params[:id])
  end

  def create
    @review = Review.new(review_params)
    @review.university_student_id = current_university_student.id
    if @review.save
      redirect_to review_thanks_url
    else
      @book = Book.find(@review.book_id)
      render 'new'
    end
  end

  def edit
    @review = Review.eager_load(:book).find(params[:id])
    @book = @review.book
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to review_thanks_url
    else
      @book = Book.find(@review.book_id)
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to request.referer
  end

  private

  def review_params
    params.require(:review).permit(:book_id, :begin_about, :begin_season, :begin_month, :finish_about,
                                   :finish_season, :finish_month, :beginning_score, :mock_exam_id,
                                   :pro, :con, :recommended_person, :recommended_usage, :evaluation)
  end

  def up_to_one
    @id = current_university_student.id
    @book = Book.find(params[:id])
    redirect_to subjects_path if Review.find_by(university_student_id: @id, book_id: @book.id).present?
  end

  def correct_review
    @review = Review.find(params[:id])
    redirect_to subjects_path unless @review.university_student_id == current_university_student.id
  end
end
