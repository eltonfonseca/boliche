class CreateFrames < ActiveRecord::Migration[5.0]
  def change
    create_table :frames do |t|

      t.timestamps
    end
  end
end
