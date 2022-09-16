class SubjectsController < ApplicationController
  before_action :authenticate_any!

  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
    if params[:q].present?
      keywords = params[:q]['name_cont'].split(/[\p{blank}\s]+/)
      grouping_hash = keywords.reduce({}){|hash, word| hash.merge(word => { name_cont: word })}
      @q = Book.where(subject_id: @subject.id).ransack({ combinator: 'and', groupings: grouping_hash })
    else
      @q = Book.where(subject_id: @subject.id).ransack(params[:q])
    end
    @books = @q.result(distinct: true).page(params[:page]).per(7)
  end
end
