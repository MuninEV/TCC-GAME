class MudarUserIdToTentativaIdTentativaQuestao < ActiveRecord::Migration[7.0]
  def change
    remove_column :tentativa_questaos, :user_id
  end
end
