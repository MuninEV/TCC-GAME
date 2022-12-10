class Tentativa < ApplicationRecord
  belongs_to :user

  has_many :tentativa_questaos
  has_many :questaos, class_name: "Questao", through: :tentativa_questaos, dependent: :delete_all


  enum :status, {finalizado: true, nao_finalizado: false}
end
