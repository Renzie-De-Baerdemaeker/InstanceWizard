class Branding < ApplicationRecord
  has_one_attached :logo
  has_one_attached :favicon
  has_one_attached :background

  validates :name, presence: true
  validates :logo, presence: true
  validates :favicon, presence: true
  validates :background, presence: true

  has_many :admins, dependent: :destroy
end
