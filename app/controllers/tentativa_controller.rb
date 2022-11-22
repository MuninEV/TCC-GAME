class TentativaController < ApplicationController
  before_action :usuario_logado?, only: [:index]
  def index
  end

  def show
    @tentativa = Tentativa.find(params[:id])
    @questoes = Questao.all.limit(10)
    respond_to do |format|
      format.html
    end
  end

  def criar_tentativa
    @tentativa = Tentativa.new(user_id: current_user.id)

    if @tentativa.save
      render json: {data: @tentativa}
    end
  end
end
