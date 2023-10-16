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
     render json: @donation, status: :created
   else
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
     render json: @donation
   else
     render json: @donation.errors, status: :unprocessable_entity
   end
 end

 # Delete a donation
 def destroy
   @donation = Donation.find(params[:id])
   @donation.destroy
   head :no_content
 end

 private

 def donation_params
   params.require(:donation).permit(:amount, :donor_id, :charity_id)
 end
end
