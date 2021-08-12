class AddPropertiesToPin < ActiveRecord::Migration[6.1]
  def change
    add_column :pins, :street, :string
    add_column :pins, :suburb, :string
    add_column :pins, :state, :string
    add_column :pins, :country, :string
    add_column :pins, :latitude, :float
    add_column :pins, :longitude, :float
  end
end
