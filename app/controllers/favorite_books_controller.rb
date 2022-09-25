class FavoriteBooksController < ApplicationController
  before_action :authenticate_examinee!
  before_action :correct_favorite, only: :show

  def show
    @exam = Examinee.find(params[:id])
    @q = @exam.favorite_books.ransack(params[:q])
    @favorite = @q.result(distinct: true).page(params[:page]).per(5)
  end

  def create
    @book = Book.find(params[:id])
    FavoriteBook.create(examinee_id: current_examinee.id, book_id: @book.id)
    redirect_to request.referer
  end

  def destroy
    @book = Book.find(params[:id])
    @favorite = FavoriteBook.find_by(examinee_id: current_examinee.id, book_id: @book.id)
    @favorite.destroy
    redirect_to request.referer
  end

  private
  def correct_favorite
    @exam = Examinee.find(params[:id])
    unless @exam.id == current_examinee.id
      redirect_to subjects_path
    end
  end
end
