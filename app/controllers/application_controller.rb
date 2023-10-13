class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    include ActionController::Cookies

#     before_action :authorized
#     attr_reader :current_user
  
#     SECRET_KEY = ENV["JWT_SECRET"]
#     # ALGORITHM = 'HS256'.freeze
  
#     def authorized
#       render json: { error: 'Unauthorized' }, status: :unauthorized unless logged_in?
#     end
  
#     def logged_in?
#       !!current_user
#     end
  
#     private
  
#     def decode_token
#       token = request.headers['Authorization']
#       if token
#         begin
#           decoded = JWT.decode(token, SECRET_KEY, true, algorithm: ALGORITHM)
#           current_user = User.find(decoded[0]['user_id'])
#         rescue JWT::DecodeError
#           nil
#         end
#       end
#     end
   end
  

