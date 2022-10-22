class QuestaoAlternativa < ApplicationRecord
  belongs_to :questao, class_name: "Questao"
  belongs_to :alternativa
end
