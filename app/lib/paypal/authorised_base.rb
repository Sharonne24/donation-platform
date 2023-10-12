module Paypal
  class AuthorisedBase < Base

    before_request do |_name, request|

      credentials = Paypal::Authentication::Credentials.call
      access_token = credentials[:access_token]

      request.headers["Authorization"] = "Bearer #{access_token}"
    end
  end
end
