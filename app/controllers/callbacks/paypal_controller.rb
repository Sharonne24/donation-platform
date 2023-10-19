class Callbacks::PaypalController < ApplicationController
    # This line specifies that this controller should not require
    # forgery protection for the 'create' action. This is useful when
    # dealing with external services like PayPal.
    protect_from_forgery except: :create
  
    # This is the 'order' action, which handles incoming requests related
    # to orders from PayPal. It appears to create a confirmation order and
    # renders the result as JSON.
    def order
      confirm_order = Paypal::ConfirmOrder.create(id: params[:token]).merge(data: confirm_payment_hash)
      
      render json: confirm_order
    end
  
    private
  
    # This private method defines the 'confirm_payment_hash', which appears
    # to structure data related to the payment source, especially for PayPal.
    # The data structure includes details like the user's name, email address,
    # and various preferences related to the payment experience.
    def confirm_payment_hash
      {
        :payment_source => {
          :paypal => {
            :name => {
              :given_name => "John",
              :surname => "Doe"
            },
            :email_address => "sb-sz2jc27127039@personal.example.com",
            :experience_context => {
              :payment_method_preference => "IMMEDIATE_PAYMENT_REQUIRED",
              :brand_name => "EXAMPLE INC",
              :locale => "en-US",
              :landing_page => "LOGIN",
              :shipping_preference => "SET_PROVIDED_ADDRESS",
              :user_action => "PAY_NOW",
              :return_url => "https://e3b3-102-213-179-31.ngrok-free.app/callback",
              :cancel_url => "https://e3b3-102-213-179-31.ngrok-free.app/callback"
            }
          }
        }
      }
    end
end
  