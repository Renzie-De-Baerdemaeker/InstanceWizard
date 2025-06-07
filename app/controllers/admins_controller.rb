class AdminsController < ApplicationController
  def index
    @branding = Branding.find(params[:branding_id]) if params[:branding_id]
    @admins = Admin.all
  end

  def show
  end

  def new
    @branding = Branding.find(params[:branding_id])
    @admin = @branding.admins.new
  end

  def create
    @branding = Branding.find(params[:branding_id])
    @admin = @branding.admins.new(admin_params)

    if @admin.save
      redirect_to branding_admins_path(@branding), notice: "Admin created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

    private
    def set_admin
      @admin = Admin.find(params[:id])
    end

    def admin_params
      params.expect(admin: [ :first_name, :last_name, :email ])
    end
end
