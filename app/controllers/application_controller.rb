class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
     include ActionController::Cookies
     before_action :authorize_paypal_api_request!
  #  before_action :authenticate_user


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
    
    def authorize_paypal_api_request!
      Paypal::Authentication::BaseConfiguration.call(
        client_id: "AbOYC78JgkXVaLNHIfpr9Wif74EYXv_gOxNh4qM0A2KjGTT-Uj5rYkgzzmKK9yXX79I9Rch2iVP0E03L",
        secret_key: "EKM9JVryB3I80Dgi2IKFKR-AUmM1X1LJhxgux5obv7VH2MI9zDgBq2sudZp8yssPGNdLeGCUj5GEpZtN")
    end
  end
  
