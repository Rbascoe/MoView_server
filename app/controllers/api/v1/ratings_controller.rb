class Api::V1::RatingsController < ApplicationController

  before_action :authorized, only: [:create]
  
  def index
  end

  def create
    rating = Rating.new(rating_params)
    user = User.find_by(id: params[:id])
    user.reviews << review
    movie = Movie.find_by(id: params[:id])
    movie.reviews << review

    if !rating.valid?
      render json: {error: "Failed to create a rating"}, status: :not_acceptable
    else
      rating.save
      render json: {rating: rating}, status: :created
    end
  end

  def update
  end

  private

  def ratng_params
    params.permit(:user_id, :movie_id, :number)
  end

end
