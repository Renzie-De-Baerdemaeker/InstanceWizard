class CreateBrandings < ActiveRecord::Migration[8.0]
  def change
    create_table :brandings do |t|
      t.string :name
      t.string :primary_color
      t.string :secondary_color_light
      t.string :secondary_color_dark
      t.string :accent_color

      t.timestamps
    end
  end
end
