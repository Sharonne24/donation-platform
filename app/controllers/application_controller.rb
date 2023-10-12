class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    include ActionController::Cookies

    before_action :authorize_paypal_api_request!

    private
  
    def authorize_paypal_api_request!
      Paypal::Authentication::BaseConfiguration.call(
        client_id: "",
        secret_key: "",
    end
end
