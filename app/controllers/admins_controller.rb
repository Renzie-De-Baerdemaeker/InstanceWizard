class AdminsController < ApplicationController
  before_action :set_branding, only: %i[ index new create ]
  def index
    @admins = @branding.admins
  end

  def show
  end

  def new
    @admin = @branding.admins.new
  end

  def create
    @admin = @branding.admins.new(admin_params)

    if @admin.save
      respond_to do |format|
        format.turbo_stream {
          render turbo_stream: [
            turbo_stream.action(:refresh, "")
          ]
        }
        format.html { redirect_to branding_admins_path(@branding) }
      end
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
    def set_branding
      @branding = Branding.find(params[:branding_id])
    end

    def admin_params
      params.expect(admin: [ :first_name, :last_name, :email ])
    end
end
