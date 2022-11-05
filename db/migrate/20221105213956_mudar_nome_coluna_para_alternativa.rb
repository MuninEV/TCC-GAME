class MudarNomeColunaParaAlternativa < ActiveRecord::Migration[7.0]
  def change
    rename_column :alternativas, :descricao_resposta, :descricao
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
