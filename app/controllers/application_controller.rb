class ApplicationController < ActionController::Base
    before_action :authenticate_user
     skip_before_action :verify_authenticity_token
     include ActionController::Cookies
  
    SECRET_KEY = ENV["JWT_SECRET"]
    # ALGORITHM = 'HS256'.freeze
  
    # def authorized
    #   render json: { error: 'Unauthorized' }, status: :unauthorized unless logged_in?
    # end
  
    # def logged_in?
    #   !!@current_user
    # end
  
    private
  
    def authenticate_user
      token = request.headers['Authorization']&.split(' ')&.last
      
      if token
        begin
          decoded = JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256' )
          @current_user = User.find(decoded[0]['user_id'])
        rescue JWT::ExpiredSignature
            render json: {error: "Expired Token"}, status: :unauthorized
        rescue JWT::DecodeError
            render json: {error: 'invalid token'}, status: :unauthorized 
        end
      else 
        render json: {error: 'missing token'}, status: :unauthorized 
      end 
    end
  end
  

    

