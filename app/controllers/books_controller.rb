class BooksController < ApplicationController
  before_action :authenticate_university_student!, only: [:index, :edit, :update]
  before_action :correct_book, only: :edit

  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true).page(params[:page]).per(7)
  end

  def show
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to new_review_url(id:@book.id)
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
    if @book.subject_id.present?
      redirect_to subjects_path
    end
  end
end
