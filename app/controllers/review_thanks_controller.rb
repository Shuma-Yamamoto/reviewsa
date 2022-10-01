# frozen_string_literal: true

class ReviewThanksController < ApplicationController
  before_action :authenticate_university_student!

  def index; end
end
