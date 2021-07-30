class AddPinRefToLocations < ActiveRecord::Migration[6.1]
  def change
    add_reference :locations, :pin, foreign_key: true
  end
end
