class Api::V1::UsersController < ApplicationController

  skip_before_action :authorized, only: [:index, :create] 
  before_action :find_user, only: [:show, :update]

  def profile
    render json: current_user, status: :accepted
  end

  def index
    users = User.all 
    render json: users, include: [:reviews, :ratings]
  end

  def create
    @user = User.new(user_params)
    if !@user.valid?
      render json: {error: "Failed to create a user"}, status: :not_acceptable
    else
      @user.save
      @token = encode_token(user_id: @user.id)
      render json: {user: @user, token: @token}, status: :created
    end
  end

  def show
    render json: user, include: [:reviews, :ratings]
  end

  def update
    user.update(user_params)
    render json: user, include: [:reviews, :ratings]
  end

  private

  def user_params
    params.permit(:name, :username, :password, :age, :bio)
  end

  def find_user
    user = User.find_by(id: params[:id])
  end

end
