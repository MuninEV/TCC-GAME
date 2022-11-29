class TentativaController < ApplicationController
  before_action :usuario_logado?, only: [:index]
  def index
  end

  def show
    @tentativa = current_user.tentativas.find(params[:id])
    @questoes = Questao.all.includes(:alternativas).sample(10)
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

  def finalizar_tentativa
    questionario = []

    dados = request.params[:tentativa].to_a.flatten

    for i in 0..dados.count
      index = 1
      if (i + index) % 2 != 0
       questionario.push({questao_id: dados[i],alternativa_id: dados[i + index]}) unless dados[i].nil? || dados[i + index].nil?
      end
      index = index+1
    end 
    
    
    questionario.each do |q|
      ##implementar a lógica aqui de salvar os dados
    end
  end
end
