# frozen_string_literal: true

class FavoriteBooksController < ApplicationController
  before_action :authenticate_examinee!
  before_action :correct_favorite, only: :show

  def show
    @examinee = Examinee.eager_load(favorite_books: :book).find(params[:id])
    @q = @examinee.favorite_books.ransack(params[:q])
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
    @examinee = Examinee.find(params[:id])
    redirect_to subjects_path unless @examinee.id == current_examinee.id
  end
end
