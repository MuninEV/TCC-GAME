class CreateTentativaQuestaos < ActiveRecord::Migration[7.0]
  def change
    create_table :tentativa_questaos do |t|
      t.references :user, null: false, foreign_key: true
      t.references :questao, null: false, index: true, foreign_key: {to_table: :questoes}

      t.timestamps
    end
  end
end
