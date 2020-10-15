class ApplicationController < ActionController::API

    before_action :authorized

    # def encode_token(payload)
    #     JWT.encode(payload, "resyoume20", "HS256") #algo is optional
    # end

    # def logged_in?
    #     authorization_header = request.headers[:authorization]
    #     if !authorization_header
    #       render status: :unauthorized
    #     else
    #       token = authorization_header.split(" ")[1]
    #       secret_key = Rails.application.secrets.secret_key_base[0]            
    #       decoded_token = JWT.decode(token, secret_key)
          
    #       user_id = decoded_token[0]["user_id"]
    #       @user = User.find_by(id: user_id)
    #     end
    # end

    def encode_token(payload)
      # should store secret in env variable
      secret_key = Rails.application.secrets.secret_key_base[0] 
      JWT.encode(payload, secret_key)
    end
   
    def auth_header
      # { Authorization: 'Bearer <token>' }
      request.headers['Authorization']
    end
   
    def decoded_token
      if auth_header
        token = auth_header.split(' ')[1]
        secret_key = Rails.application.secrets.secret_key_base[0] 
        # header: { 'Authorization': 'Bearer <token>' }
        begin
          JWT.decode(token, secret_key, true, algorithm: 'HS256')
        rescue JWT::DecodeError
          nil
        end
      end
    end
   
    def current_user
      if decoded_token
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
      end
    end
   
    def logged_in?
      !!current_user
    end
   
    def authorized
      render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end
  
end
