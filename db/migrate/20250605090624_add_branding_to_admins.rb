class AddBrandingToAdmins < ActiveRecord::Migration[8.0]
  def change
    add_reference :admins, :branding, null: false, foreign_key: true
  end
end
