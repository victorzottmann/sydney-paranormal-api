class AddPinRefToPinFamilies < ActiveRecord::Migration[6.1]
  def change
    add_reference :pin_families, :pin, foreign_key: true
  end
end
