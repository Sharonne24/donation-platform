# frozen_string_literal: true

module Paypal
  module Authentication
    class Credentials
   
      attr_reader :request_store

      def self.call
        new.call
      end

      def initialize(store = RequestStore)
        @request_store = store
      end

      def call
        credentials = request_store.store
        return renew if credentials.empty? || expired?

        credentials
      end

      def renew
        request_store.store[:paypal_api_auth] = {
          access_token: login.access_token,
          issued_at: Time.now.utc.to_i,
          expiry_date: login.expires_in
        }
      end

      def expired?
        issued_at = paypal_api_auth[:issued_at]
        expiry_date = paypal_api_auth[:expiry_date].to_i

        return true unless issued_at && expiry_date

        current_time = Time.now.utc.to_i
       
        (issued_at + expiry_date) <= current_time
      end

      private

      def paypal_api_auth
        request_store.store[:paypal_api_auth] || {}
      end

      def login
        @login ||= Paypal::Login.create()
      end
    end
  end
end
