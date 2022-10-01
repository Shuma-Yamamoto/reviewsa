# frozen_string_literal: true

class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.eager_load(books: :reviews).find(params[:id])
    @books = @subject.books

    @review_group = Review.joins(:book).where(book: { subject_id: @subject.id }).group(:book_id)
    @review_avgs = @review_group.average(:evaluation)
    @review_cnts = @review_group.count(:evaluation)

    search_books
  end
end
