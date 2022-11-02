class DeleteAlternativasCorretaIdToQuestao < ActiveRecord::Migration[7.0]
  def change
    remove_column :questoes, :alternativa_correta_id
  end
end
