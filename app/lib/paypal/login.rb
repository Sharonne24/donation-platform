module Paypal
  class Login < Base
    post :create, '/v1/oauth2/token?grant_type=client_credentials'

    verbose!

    before_request do |_name, request|
      client_id  = Paypal::Authentication::Keys.client_id
      secret_key = Paypal::Authentication::Keys.secret_key
      token = Base64.strict_encode64("#{client_id}:#{secret_key}")

      request.headers['Authorization'] = "Basic #{token}".strip
      request.headers['Content-Type'] = 'application/x-www-form-urlencoded'
    end
  end
end
