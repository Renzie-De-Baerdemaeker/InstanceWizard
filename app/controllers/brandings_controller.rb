class BrandingsController < ApplicationController
    before_action :set_branding, only: %i[ update preview add_colors config_file]

  def preview
  end

  def add_colors
    if @branding.update(branding_color_params)
      redirect_to branding_admins_path(@branding)
    else
      render :preview, status: :unprocessable_entity
    end
  end

  def new
    @branding = Branding.new
  end

  def create
    @branding = Branding.new(branding_create_params)
    if @branding.save
      redirect_to preview_branding_path(@branding)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @branding.update(branding_params)
      redirect_to @branding
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def config_file
    toml_content = ConfigGenerator.generate(@branding)

    send_data toml_content,
              type: "application/toml",
              filename: "#{@branding.name.parameterize}_config.toml"
  end

  private
    def set_branding
      @branding = Branding.find(params[:id])
    end

    def branding_create_params
      params.expect(branding: [ :name, :logo, :favicon, :background ])
    end

    def branding_color_params
      params.expect(branding: [ :primary_color, :secondary_color_light, :secondary_color_dark, :accent_color ])
    end
end
