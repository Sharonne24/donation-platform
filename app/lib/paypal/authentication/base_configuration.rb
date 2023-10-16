module Paypal
  module Authentication
    class BaseConfiguration
      
      BaseError = Class.new(StandardError)

      MissingCredentialsError = Class.new(BaseError)
      
      MissingBaseUrlError = Class.new(BaseError)

      class << self
        def call(options = {})
          RequestStore.store[:paypal_api_keys] = {}

          configure_auth_keys(
            client_id: options[:client_id],
            secret_key: options[:secret_key]
          )
        end

        def configure_auth_keys(client_id:, secret_key:)
          raise MissingCredentialsError unless client_id && secret_key

          RequestStore.store[:paypal_api_keys][:client_id] = client_id
          RequestStore.store[:paypal_api_keys][:secret_key] = secret_key
        end
      end
    end
  end
end
