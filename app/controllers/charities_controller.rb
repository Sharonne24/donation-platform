class CharitiesController < ApplicationController
  # Display a list of charities
  def index
    charities = Charity.all
    render json: charities
  end

  # Apply to Become a Charity
  def apply
     charity = Charity.create!(charity_params)

    if charity
      render json: { message: "Your charity application has been submitted. We will review it shortly." }, status: :created
    else
      render json: {message: "Application failed"}, status: :internal_server_error
    end
  end

  # show charity details
  def show
    charity = Charity.find(params[:id])
    render json: charity
  end

  # Edit the charity details
  def edit
    charity = Charity.find(params[:id])
    render json: charity
  end
  
  # Update the charity details
  def update
    charity = Charity.find(params[:id])
    if charity.update(charity_params)
      render json: { message: "Charity details were successfully updated." }, status: :created
    else
      render json: {message: "Charity details were not successfully updated"}, status: :internal_server_error
    end
  end

  def donate
    charity = Charity.find(params[:id])
    @donation = charity.donations.build(donation_params)
    session[:amount] = @donation.amount
    response = Paypal::Checkout.create(paypal_payment_hash)
    checkout_link = response.links.find { |link| link['rel'] == 'payer-action' }
    @donation.paypal_response = response
    @donation.redirect_url = checkout_link['href']
    if @donation.save
      session.delete('amount')
      render json: @donation, status: :created
    else
      render json: @donation.errors, status: :unprocessable_entity
    end
  end

  private

  def find_charity
    @charity = Charity.find(params[:id])
  end


  def charity_params
    params.permit(:name, :description, :status, :image_url).merge(user_id: session[:user_id])
  end

  def donation_params
    params.permit(:amount, :recurring, :anonymous).merge(user_id: session[:user_id])
  end

  def paypal_payment_hash
    {
      :intent => "CAPTURE",
      :purchase_units => [
        {
          :reference_id => generate_reference_id,
          :amount => {
            :currency_code => "USD",
            :value => "10"
          }
        }
      ],
      :payment_source => {
        :paypal => {
          :experience_context => {
            :payment_method_preference => "IMMEDIATE_PAYMENT_REQUIRED",
            :brand_name => "EXAMPLE INC",
            :locale => "en-US",
            :landing_page => "LOGIN",
            :shipping_preference => "GET_FROM_FILE",
            :user_action => "PAY_NOW",
            :return_url => "https://example.com/returnUrl",
            :cancel_url => "https://example.com/cancelUrl"
          }
        }
      }
    }
  end

  def generate_reference_id
    "d9f80740-38f0-11e8-b467-0ed5f89f718b"

    # SecureRandom.urlsafe_base64(15)
  end
  
  def handle_unprocessable_entity(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end
end
