class SubjectsController < ApplicationController
  before_action :authenticate_any!

  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
    @q = Book.where(subject_id: @subject.id).ransack(params[:q])
    @books = @q.result(distinct: true).page(params[:page]).per(7)
  end
end
