class AddQuantityToPlacements < ActiveRecord::Migration
  def change
    add_column :placements, :quantity, :integer, default: 0
  end
end
