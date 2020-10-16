class Api::V1::ReviewsController < ApplicationController

  skip_before_action :authorized, only: [:create]

  def index
    reviews = Review.all
    render json: reviews
  end

  def create
      review = Review.new(review_params)
      user = User.find_by(id: params[:id])
      user.reviews << review
      movie = Movie.find_by(id: params[:id])
      movie.reviews << review
      if !review.valid?
        render json: {error: "Failed to create a review"}, status: :not_acceptable
      else
        review.save
        render json: {review: review}, status: :created
      end
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.permit(:user_id, :movie_id, :content, :upvotes, :downvotes)
  end

end
