class CreateQuestaoAlternativas < ActiveRecord::Migration[7.0]
  def change
    create_table :questao_alternativas do |t|
      t.references :questao, null: false,  index: true, foreign_key: {to_table: :questoes}
      t.references :alternativa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
