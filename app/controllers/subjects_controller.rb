class SubjectsController < ApplicationController
  before_action :authenticate_university_student!
  def index
    @subjects = Subject.all
  end
end
