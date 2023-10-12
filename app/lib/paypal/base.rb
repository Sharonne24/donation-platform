# frozen_string_literal: true

module Paypal
  class Base < Flexirest::Base

    base_url "https://api-m.sandbox.paypal.com"

    request_body_type :json

    protected

    def camelize_params(_name, request)
      request.post_params.transform_keys! do |key|
        key.to_s.camelize.to_sym
      end
    end
  end
end
