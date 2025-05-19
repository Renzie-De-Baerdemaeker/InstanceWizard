class Branding < ApplicationRecord
  has_one_attached :logo
  has_one_attached :favicon
  has_one_attached :background
end
