# frozen_string_literal: true

class FavoriteReviewsController < ApplicationController
  before_action :authenticate_examinee!
  before_action :correct_favorite,
                only: :show

  def show
    @examinee = Examinee.eager_load(favorite_reviews:
                                      { review: [:book, { university_student: :university }] }).find(params[:id])
    @q = @examinee.favorite_reviews.ransack(params[:q])
    @favorite = @q.result(distinct: true).page(params[:page]).per(5)
  end

  def create
    @review = Review.find(params[:id])
    FavoriteReview.create(
      examinee_id: current_examinee.id, review_id: @review.id
    )
    redirect_to request.referer
  end

  def destroy
    @review = Review.find(params[:id])
    @favorite = FavoriteReview.find_by(
      examinee_id: current_examinee.id, review_id: @review.id
    )
    @favorite.destroy
    redirect_to request.referer
  end

  private

  def correct_favorite
    @examinee = Examinee.find(params[:id])
    redirect_to subjects_path unless @examinee.id == current_examinee.id
  end
end
