class ApplicationController < ActionController::API

    # before_action :logged_in?

    # def encode_token(payload)
    #     JWT.encode(payload, "resyoume20", "HS256") #algo is optional
    # end

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
