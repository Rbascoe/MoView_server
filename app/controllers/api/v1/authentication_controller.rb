class Api::V1::AuthenticationController < ApplicationController

    def login
        user = User.find_by(username: :params[:username])

        if (!user)
            render json: { error: "Invalid username" }
        end

        if user.authenticate(params[:password])
            render json: { message: "Correct Password" }
        else
            render json: { message: "Incorrect Password" }
        end
    end

end
