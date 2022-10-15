class AddAlternativasIdsToQuestao < ActiveRecord::Migration[7.0]
  def change 
    add_column :questoes, :alternativas_ids, :integer, array: true, default: []
  end
end
