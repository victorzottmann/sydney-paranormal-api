class CreatePinFamilies < ActiveRecord::Migration[6.1]
  def change
    create_table :pin_families do |t|

      t.timestamps
    end
  end
end
