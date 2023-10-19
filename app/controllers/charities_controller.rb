class CharitiesController < ApplicationController
  # before_action :authenticate_user
  # before_action :charity, only: [:apply, :edit, :update, :index]
  # before_action :admin, only: [:index]

  # Display charities based on the different roles
  def index
    # if @current_user&.role == "admin"
    #   charities = Charity.all
    # elsif @current_user&.role == "charity"
    #   charities = Charity.where(user_id: @current_user&.id)
    # else 
    #   charities = Charity.where(status: ["active", "approved"])
    # end
    charities = Charity.all

    render json: charities
  end

  # Apply to Become a Charity
  def apply
    if @current_user.role == "charity"
      charity = Charity.create!(charity_params)
      render json: { message: "Your charity application has been submitted. We will review it shortly." }, status: :created
    else
      render json: {message: "Unauthorized User"}, status: :internal_server_error
    end
end

  # show charity details
  def show
    charity = Charity.find(params[:id])
    render json: charity
  end

  # Edit the charity details
  # def edit
  #   charity = Charity.find(params[:id])
  #   if @current_user.role == "charity"
  #     render json: { message: "Charity details have been successfully edited." }, status: :created
  #   else
  #     render json: {message: "Unauthorized user"}, status: :internal_server_error
  #   end
  # end
  
  # Update the charity details
  def update
    charity = Charity.find(params[:id])
    if @current_user.role == "charity"
       charity.update(charity_params)
      render json: { message: "Charity details were successfully updated." }, status: :created
    else
      render json: {message: "Unauthorized user"}, status: :internal_server_error
    end
  end

  # Method for admin to view pending charities applied by charities
  def pending
    charities = Charity.where(status: "pending")
    render json: charities
  end

  def approve_reject
    charity = Charity.find(params[:id])
    if @current_user.role == "admin"
       charity.update(status: params[:status])
      render json: { message: "Charity status successfully updated." }, status: :created
    else
      render json: {message: "Charity status not successfully updated"}, status: :internal_server_error
    end
  end
  def donate
    charity = Charity.find(params[:id])
    @donation = charity.donations.build
    # .merge(user_id: @current_user.id)
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

  # Method for admin to check the status of a specific charity
  def check_status
    charity = Charity.find(params[:id])
    render json: { status: charity.status }
  end

  def paypal_payment_hash
    {
      :intent => "CAPTURE",
      :purchase_units => [
        {
          :reference_id => generate_reference_id,
          :amount => {
            :currency_code => "USD",
            :value => "15"
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
            :return_url => "https://6e88-197-237-12-40.ngrok-free.app/callback",
            :cancel_url => "https://6e88-197-237-12-40.ngrok-free.app/callback"
          }
        }
      }
    }
  end

  def generate_reference_id
    "d9f80740-38f0-11e8-b467-0ed5f89f718b"

    # SecureRandom.urlsafe_base64(15)

  end

  private

  def charity_params
    params.permit(:name, :description, :status, :image_url).merge(user_id: session[:user_id])
  end

  def charity
    unless @current_user.role == "charity"
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  def admin
    unless @current_user.role == "admin"
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
    
  def donation_params
    params.permit(:amount, :recurring, :anonymous).merge(user_id: session[:user_id])
  end


  def handle_unprocessable_entity(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end
end
end
