class Questao < ApplicationRecord
  self.table_name="questoes"
  belongs_to :dificuldade

  has_many  :questao_alternativas
  has_many  :alternativas, through: :questao_alternativas, dependent: :delete_all
  has_many  :tentativa_questaos
  has_many  :tentativas, through: :tentativa_questaos, dependent: :delete_all
  
  validates :enunciado, presence: true
end
