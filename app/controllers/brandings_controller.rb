class BrandingsController < ApplicationController
    before_action :set_branding, only: %i[ show edit update preview ]

  def index
  end

  def show
  end

  def preview
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

  def edit
  end

  def update
    if @branding.update(branding_params)
      redirect_to @branding
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def set_branding
      @branding = Branding.find(params[:id])
    end


    def branding_params
      params.expect(branding: [ :name, :logo, :favicon, :background ])
    end
end
