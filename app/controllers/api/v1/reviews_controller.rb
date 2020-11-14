class Api::V1::ReviewsController < ApplicationController

  skip_before_action :authorized, only: [:index, :create, :destroy]

  def index
    movie = Movie.find_by(id: params[:movie_id])
    @reviews = movie.reviews
    # user = User.find_by(id: params[:user_id])
    # user_reviews = user.reviews
    render json: @reviews 
  end

  def create
      @review = Review.new(review_params)
      # byebug
      user = User.find_by(id: params["user_id"])
      user.reviews << @review
      movie = Movie.find_by(id: params["movie_id"])
      movie.reviews << @review
      
      if !@review.valid?
        render json: {error: "Failed to create a review"}, status: :not_acceptable
      else
        @review.save
        render json: {review: @review}, status: :created
      end
  end

  def update
    review = Review.find_by(id: params[:id])
    review.update(review_params)
    render json: review
  end

  def destroy
    byebug
    # movie = Movie.find_by(id: params["movie_id"])
    review = Review.find_by(id: params[:id])
    review.destroy
    render json: "Review Deleted"
  end

  private

  def review_params
    # byebug
    params.permit(:user_id, :movie_id, :content, :upvotes, :downvotes)
  end

end
