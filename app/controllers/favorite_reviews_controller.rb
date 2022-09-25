class FavoriteReviewsController < ApplicationController
  before_action :authenticate_examinee!
  before_action :correct_favorite, only: :show

  def show
    @exam = Examinee.find(params[:id])
    @q = @exam.favorite_reviews.ransack(params[:q])
    @favorite = @q.result(distinct: true).page(params[:page]).per(5)
  end

  def create
    @review = Review.find(params[:id])
    FavoriteReview.create(examinee_id: current_examinee.id, review_id: @review.id)
    redirect_to request.referer
  end

  def destroy
    @review = Review.find(params[:id])
    @favorite = FavoriteReview.find_by(examinee_id: current_examinee.id, review_id: @review.id)
    @favorite.destroy
    redirect_to request.referer
  end

  private
  def correct_favorite
    @exam = Examinee.find(params[:id])
    unless @exam.id == current_examinee.id
      redirect_to subjects_path
    end
  end
end
