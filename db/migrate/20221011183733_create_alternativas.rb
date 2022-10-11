class CreateAlternativas < ActiveRecord::Migration[7.0]
  def change
    create_table :alternativas do |t|
      t.string :descricao_resposta
      t.boolean :correto

      t.timestamps
    end
  end
end
