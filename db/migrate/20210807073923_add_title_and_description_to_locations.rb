class AddTitleAndDescriptionToLocations < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :title, :string
    add_column :locations, :description, :string
  end
end
