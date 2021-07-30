class AddPinFamilyRefToPins < ActiveRecord::Migration[6.1]
  def change
    add_reference :pins, :pin_family, foreign_key: true
  end
end
