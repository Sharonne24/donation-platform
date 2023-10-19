class Callbacks::PaypalController < ApplicationController
    protect_from_forgery except: :create
  
    def order
      confirm_order = Paypal::ConfirmOrder.create(id: params[:token]).merge(data: confirm_payment_hash)
      
      render json:confirm_order 
    end
  
    private
  
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
  