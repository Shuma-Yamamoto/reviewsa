class BooksController < ApplicationController
  before_action :authenticate_university_student!, only: [:index, :edit, :update]
  before_action :correct_book, only: :edit

  def index
    @books = Book.all.eager_load(reviews: :university_student)
    if params[:q].present?
      keywords = params[:q]['name_cont'].split(/[\p{blank}\s]+/)
      grouping_hash = keywords.reduce({}){|hash, word| hash.merge(word => { name_cont: word })}
      @q = @books.ransack({ combinator: 'and', groupings: grouping_hash })
    else
      @q = @books.ransack(params[:q])
    end
    @books = @q.result(distinct: true).page(params[:page]).per(7)
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
