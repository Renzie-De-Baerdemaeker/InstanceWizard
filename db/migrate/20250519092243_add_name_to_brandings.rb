class AddNameToBrandings < ActiveRecord::Migration[8.0]
  def change
    add_column :brandings, :name, :string
  end
end
