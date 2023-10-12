class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    include ActionController::Cookies

    before_action :authorize_paypal_api_request!

    private
  
    def authorize_paypal_api_request!
      Paypal::Authentication::BaseConfiguration.call(
        client_id: "AbOYC78JgkXVaLNHIfpr9Wif74EYXv_gOxNh4qM0A2KjGTT-Uj5rYkgzzmKK9yXX79I9Rch2iVP0E03L",
        secret_key: "EKM9JVryB3I80Dgi2IKFKR-AUmM1X1LJhxgux5obv7VH2MI9zDgBq2sudZp8yssPGNdLeGCUj5GEpZtN")
    end
end
