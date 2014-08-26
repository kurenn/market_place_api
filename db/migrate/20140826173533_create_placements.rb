class CreatePlacements < ActiveRecord::Migration
  def change
    create_table :placements do |t|
      t.references :order, index: true
      t.references :product, index: true

      t.timestamps
    end
  end
end
