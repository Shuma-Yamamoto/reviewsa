class FavoriteBooksController < ApplicationController
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
end
