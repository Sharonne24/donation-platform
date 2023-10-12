module Paypal
  module Authentication
    module Keys

      MissingKeysError = Class.new(StandardError)

      class << self
        def client_id
          keys[:client_id] || raise_error(:client_id)
        end

        def secret_key
          keys[:secret_key] || raise_error(:secret_key)
        end

        private

        def keys
          RequestStore.store[:paypal_api_keys] || {}
        end

        def raise_error(subject)
          raise MissingKeysError, "Missing #{subject} key"
        end
      end
    end
  end
end
