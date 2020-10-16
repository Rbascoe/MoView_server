class Api::V1::MoviesController < ApplicationController
  
  skip_before_action :authorized
  
  def index
    movies = Movie.all 
    render json: movies
  end

  def show
    movie = Movie.find_by(id: params[:id])
    render json: movie, include: [:reviews, :rating]
  end

end
