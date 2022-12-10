class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, 
         authentication_keys: [:nome_usuario]
  enum :tipo_usuario, {administrador: 0, jogador: 1}
  validates :email, :uniqueness => {:allow_blank => true}

  has_many :tentativas


  def adm?
    self&.tipo_usuario&.to_sym == :administrador
  end
end
