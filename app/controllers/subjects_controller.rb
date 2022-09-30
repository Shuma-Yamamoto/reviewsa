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

    if params[:q].present?
      keywords = params[:q]['name_cont'].split(/[\p{blank}\s]+/)
      grouping_hash = keywords.reduce({}){|hash, word| hash.merge(word => { name_cont: word })}
      @q = @books.ransack({ combinator: 'and', groupings: grouping_hash })
    else
      @q = @books.ransack(params[:q])
    end
    @books = @q.result(distinct: true).page(params[:page]).per(7)
  end
end
