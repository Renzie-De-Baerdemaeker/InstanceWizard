class Admin < ApplicationRecord
  belongs_to :branding
  validates :first_name, :last_name, :email, presence: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP
end
