class Questao < ApplicationRecord
  self.table_name="questoes"
  belongs_to :dificuldade
end
