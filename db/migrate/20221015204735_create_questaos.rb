class CreateQuestaos < ActiveRecord::Migration[7.0]
  def change
    create_table :questoes do |t|
      t.string :descricao
      t.integer :alternativa_correta_id
      t.references :dificuldade, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
