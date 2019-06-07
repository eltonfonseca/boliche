class CreatePartidas < ActiveRecord::Migration[5.0]
  def change
    create_table :partidas do |t|

      t.timestamps
    end
  end
end
