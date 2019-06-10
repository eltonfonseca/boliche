class Match < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :scoreP1, :integer
    add_column :matches, :scoreP2, :integer
    end
end
