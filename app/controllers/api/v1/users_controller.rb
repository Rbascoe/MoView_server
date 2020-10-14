class Api::V1::UsersController < ApplicationController

  skip_before_action :logged_in?, only: [:create] 

  def index
    users = User.all 
    render json: users, include: [:reviews]
  end

  def create
    user = User.new(user_params)
    if !user.valid?
      render json: {error: "Failed to create a user"}, status: :not_acceptable
    else
      user.save
      render json: {user: user}, status: :created
    end
  end

  private

  def user_params
    params.permit(:name, :username, :password, :age, :bio)
  end

end
