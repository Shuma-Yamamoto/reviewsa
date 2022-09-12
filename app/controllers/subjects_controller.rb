class SubjectsController < ApplicationController
  before_action :authenticate_any!

  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
  end
end
