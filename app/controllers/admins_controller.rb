class AdminsController < ApplicationController
  def index
    @branding = Branding.find(params[:branding_id]) if params[:branding_id]
    @admins = Admin.all
  end

  def show
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to admins_path, notice: "Admin created successfully"
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
