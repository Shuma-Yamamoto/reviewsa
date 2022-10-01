# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :authenticate_university_student!,
                only: %i[index
                         edit update]
  before_action :correct_book,
                only: :edit

  def index
    @books = Book.all.eager_load(reviews: :university_student)
    search_books
  end

  def show
    @book = Book.eager_load(reviews: { university_student: :university }).find(params[:id])
    @reviews = @book.reviews.page(params[:page]).per(7)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to new_review_url(id: @book.id)
    else
      render 'edit'
    end
  end

  private

  def book_params
    params.require(:book).permit(:subject_id)
  end

  def correct_book
    @book = Book.find(params[:id])
    redirect_to subjects_path if @book.subject_id.present?
  end
end
