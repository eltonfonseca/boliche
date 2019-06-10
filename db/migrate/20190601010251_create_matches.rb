class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.string :name
      t.integer :difficulty
      t.integer :scoreP1
      t.integer :scoreP2
      t.timestamps
    end
  end
end
