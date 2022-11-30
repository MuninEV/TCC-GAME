class Alternativa < ApplicationRecord
    has_many  :questao_alternativas
    has_many  :questaos, class_name: "Questao", through: :questao_alternativas, dependent: :delete_all

    validates :descricao, presence: true
end
