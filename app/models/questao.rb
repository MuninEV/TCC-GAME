class Questao < ApplicationRecord
  self.table_name="questoes"
  belongs_to :dificuldade

  has_many  :questao_alternativas
  has_many  :alternativas, through: :questao_alternativas
end
