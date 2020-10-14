class ApplicationController < ActionController::API

    before_action :logged_in?

    # def encode_token(payload)
    #     JWT.encode(payload, "resyoume20", "HS256") #algo is optional
    # end

    def logged_in?
        authorization_header = request.headers[:authorization]
        if !authorization_header
          render status: :unauthorized
        else
          token = authorization_header.split(" ")[1]
          secret_key = Rails.application.secrets.secret_key_base[0]            
          decoded_token = JWT.decode(token, secret_key)
    
          @user = User.find(decoded_token["user_id"])
        end
    end

    # def logged_in?
    #     # byebug
    #     headers = request.headers["Authorization"]
    #     token = headers.split(" ")[1]

    #     begin
    #         user_id = JWT.decode(token, "resyoume20")[0]["user_id"]
    #         user = User.find(user_id)
    #     rescue
    #         user = nil
    #     end

    #     render json: {error: "Please LogIn!!!"} unless user
    # end
end
