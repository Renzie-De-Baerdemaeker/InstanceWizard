class BrandingsController < ApplicationController
  def index
  end

  def show
    @branding = Branding.find(params[:id])
  end

  def preview
    @branding = Branding.find(params[:id])
  end
  

  def new         
    @branding = Branding.new
  end

  def create
    @branding = Branding.new(branding_params)
    if @branding.save
      redirect_to preview_branding_path(@branding)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def branding_params
      params.expect(branding: [ :name, :logo, :favicon, :background ])
    end

end
