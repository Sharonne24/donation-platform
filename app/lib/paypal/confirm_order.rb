module Paypal
  class ConfirmOrder < AuthorisedBase
    post :create, "/v2/checkout/orders/:id/capture"

    verbose!

    before_request do |_name, request|
      request.headers['Content-Type'] = 'application/json'
      request.headers['PayPal-Request-Id'] = '7b92603e-77ed-4896-8e78-5dea2050476a'
    end
  end
end
