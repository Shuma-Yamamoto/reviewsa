class FavoriteReviewsController < ApplicationController
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
end
