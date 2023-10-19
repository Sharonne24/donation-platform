class BeneficiariesController < ApplicationController
    # List all beneficiaries
    def index
      @beneficiaries = Beneficiary.all
      render json: @beneficiaries
    end
   
    # Create a new beneficiary
    def create
      @beneficiary = Beneficiary.new(beneficiary_params)
      if @beneficiary.save
        render json: @beneficiary, status: :created
      else
        render json: @beneficiary.errors, status: :unprocessable_entity
      end
    end
   
    # Show a specific beneficiary
    def show
      @beneficiary = Beneficiary.find(params[:id])
      render json: @beneficiary
    end
   
    # Edit a beneficiary
    def edit
      @beneficiary = Beneficiary.find(params[:id])
      if @beneficiary.update(beneficiary_params)
        render json: @beneficiary
      else
        render json: @beneficiary.errors, status: :unprocessable_entity
      end
    end
   
    # Delete a beneficiary
    def destroy 
      @beneficiary = Beneficiary.find(params[:id])
      @beneficiary.destroy
      head :no_content
    end
   
    private
   
    def beneficiary_params
      params.require(:beneficiary).permit(:name, :description, :location)
    end
   end
   