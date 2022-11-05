class MudarNomeColunaParaQuestoes < ActiveRecord::Migration[7.0]
  def change
    rename_column :questoes, :descricao, :enunciado
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
