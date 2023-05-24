class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.integer :nr
      t.string :termin
      t.string :nazwa
      t.text :tresc
      t.integer :waznosc
      t.integer :stopien_postepu

      t.timestamps
    end
  end
end
