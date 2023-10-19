class AdminController < ApplicationController
 # List all admin users
 def index
    @admins = Admin.all
    render json: @admins
  end

 # Create a new admin user
 def create
    @admin = Admin.new(admin_params)
    if @admin.save
      render json: @admin, status: :created
    else
      render json: @admin.errors, status: :unprocessable_entity
    end
  end

 # Show a specific admin user
 def show
    @admin = Admin.find(params[:id])
    render json: @admin
  end

 # Edit an admin user
 def edit
    @admin = Admin.find(params[:id])
    if @admin.update(admin_params)
      render json: @admin
    else
      render json: @admin.errors, status: :unprocessable_entity
    end
  end

 # Delete an admin user
 def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy
    head :no_content
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :email, :password)
  end
end
