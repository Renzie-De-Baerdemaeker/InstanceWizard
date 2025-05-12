class BrandingColorsController < ApplicationController
    def new
        @branding_color = BrandingColor.new
      end
end
