class Api::V1::MoviesController < ApplicationController
  
  skip_before_action :logged_in?
  
  def index
    movies = Movie.all 
    render json: movies
  end

end
