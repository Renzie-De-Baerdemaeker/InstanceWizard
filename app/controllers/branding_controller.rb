class BrandingController < ApplicationController
  def index
  end

  def new         
    @branding = Branding.new
  end
end
