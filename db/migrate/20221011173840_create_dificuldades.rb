class CreateDificuldades < ActiveRecord::Migration[7.0]
  def change
    create_table :dificuldades do |t|
      t.string :nivel
      t.integer :pontuacao

      t.timestamps
    end
  end
end
