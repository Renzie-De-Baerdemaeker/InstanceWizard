class CreateBrandingColors < ActiveRecord::Migration[8.0]
  def change
    create_table :branding_colors do |t|
      t.string :primary
      t.string :secondary_light
      t.string :secondary_dark
      t.string :accent

      t.timestamps
    end
  end
end
