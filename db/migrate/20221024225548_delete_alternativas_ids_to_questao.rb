class DeleteAlternativasIdsToQuestao < ActiveRecord::Migration[7.0]
  def change
    remove_column :questoes, :alternativas_ids
  end
end
