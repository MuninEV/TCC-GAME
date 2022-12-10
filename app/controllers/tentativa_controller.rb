class TentativaController < ApplicationController
  before_action :usuario_logado?, only: [:index]
  before_action :tentativa_maxima, only: [:criar_tentativa]

  def index
  end

  def show
    @tentativa = current_user.tentativas.find(params[:id])

    if @tentativa.finalizado?
      redirect_to tentativa_finalizada_url
    end

    @questoes = Questao.all.includes(:alternativas).sample(10)
    respond_to do |format|
      format.html
    end
  end

  def criar_tentativa
    @tentativa = Tentativa.new(user_id: current_user.id)
    
    if @tentativa.save
      render json: {data: @tentativa}, status: 200
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
      alternativa = Questao.find(q[:questao_id]).alternativas.find(q[:alternativa_id])

      if alternativa.correto?
        TentativaQuestao.create!(questao_id: q[:questao_id], tentativa_id: params[:tentativa_id])
      end
      
    end

    @tentativa = Tentativa.find(params[:tentativa_id])

    @tentativa.update_attribute :status, :finalizado

    redirect_to revisar_url(tentativa_id: @tentativa.id)
  end


  def tentativa_finalizada  
  end

  def tentativa_maxima
    if current_user.tentativas.count >= 3
      render json: {message: "Você chegou no limite de tentativas!!!"}, :status => 422
    end
  end
end
