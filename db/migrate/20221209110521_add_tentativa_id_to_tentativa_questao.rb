class AddTentativaIdToTentativaQuestao < ActiveRecord::Migration[7.0]
  def change
    add_column :tentativa_questaos, :tentativa_id, :integer
    #Ex:- :null => false
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
