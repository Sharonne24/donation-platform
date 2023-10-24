class DonationsController < ApplicationController
  # List all donations
  def index
    @donations = Donation.all
    render json: @donations
  end

  # Create a new donation
 def create
    @donation = Donation.new(donation_params)
    if @donation.save
      # If the donation is successfully saved, render it as JSON with a
      # 201 Created status.
      render json: @donation, status: :created
    else
      # If there are errors during creation, render the errors as JSON
      # with a 422 Unprocessable Entity status.
      render json: @donation.errors, status: :unprocessable_entity
    end
  end

  # Show a specific donation
  def show
    @donation = Donation.find(params[:id])
    render json: @donation
  end

    # Edit a donation
    def edit
        @donation = Donation.find(params[:id])
        if @donation.update(donation_params)
          # If the donation is successfully updated, render it as JSON.
          render json: @donation
        else
          # If there are errors during update, render the errors as JSON with
          # a 422 Unprocessable Entity status.
          render json: @donation.errors, status: :unprocessable_entity
        end
      end

  # Delete a donation
  def destroy
    @donation = Donation.find(params[:id])
    @donation.destroy
    # Set the response status to indicate success without any content.
    head :no_content
  end

  private

  # Strong parameters to define which attributes are allowed for mass
  # assignment when creating or updating a donation.
  def donation_params
    params.require(:donation).permit(:amount, :donor_id, :charity_id)
  end

end
