class Api::V1::AuthenticationController < ApplicationController

    skip_before_action :authorized
    
    def login
        @user = User.find_by(username: params[:username])

        if (!@user)
            render json: { error: "Invalid username" }
        end

        if @user && @user.authenticate(params[:password])
            secret_key = Rails.application.secrets.secret_key_base[0]
            token = JWT.encode({
                user_id: @user.id,
                username: @user.username
            }, secret_key)
            render json: { user: @user, include: [:reviews, :ratings],token: token }
        else
            render json: { message: "Incorrect Password" }
        end
    end

private
 
#   def user_login_params
#     params.require(:user).permit(:username, :password)
#   end

end
