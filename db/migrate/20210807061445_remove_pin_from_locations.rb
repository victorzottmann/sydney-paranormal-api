class RemovePinFromLocations < ActiveRecord::Migration[6.1]
  def change
    remove_column :locations, :pin_id, :string
  end
end
