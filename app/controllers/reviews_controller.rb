class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to cook_path(params[:cook_id])
    else
      @cook = @review.cook
      @reviews = @cook.reviews
      render "cooks/show"
    end
  end

  private
  def review_params
    params.require(:review).permit(:rate,:comment).merge(user_id: current_user.id,cook_id: params[:cook_id])
  end
end
