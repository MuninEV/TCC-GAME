class PontuacaoController < ApplicationController
  def pontuacao
    @tentativa = Tentativa.find(params[:tentativa_id])
    @soma =  @tentativa.questaos.map(&:dificuldade).map(&:pontuacao).sum


    @array_com_dados = []

    @tentativa.questaos.each do |questao|
      
      alternativa = questao.alternativas.where.not(explicacao: "").first

      @array_com_dados.push({
        questao: questao.enunciado,
        alternativa: alternativa
      })
      
    end  
    @valor = @soma
  end
end
