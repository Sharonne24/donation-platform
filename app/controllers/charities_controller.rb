class CharitiesController < ApplicationController
  before_action :authenticate_user!, only: [:apply, :edit, :update, :donors, :donations, :stories, :beneficiaries, :automated_donations]

  def apply
  @charity = current_user.charities.build(charity_params)
  @charity.status = 'pending'

  if @charity.save
    render json: {message: "Your charity application has been submitted. We will review it shortly."}
    
  else
    render json:'apply'
  end
end

# Action for creating charities (admin or other scenarios)
# def create
#   @charity = Charity.new(charity_params)

#   if @charity.save
#     render json: @charity, status: :created
#   else
#     render json: @charity.errors, status: :unprocessable_entity
#   end
# end


  def edit
  end

  def update
  end

  def donors
  end

  def donations
  end

  def stories
  end

  def beneficiaries
  end

  def automated_donations
  end

  private

def charity_params
  params.permit(:charity).permit(:name, :description, :status, :image_url)
  end
end
