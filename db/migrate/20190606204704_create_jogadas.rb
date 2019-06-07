class CreateJogadas < ActiveRecord::Migration[5.0]
  def change
    create_table :jogadas do |t|

      t.timestamps
    end
  end
end
