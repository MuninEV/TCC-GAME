class RevisaoController < ApplicationController
  def revisar
    @tentativa = Tentativa.find(params[:tentativa_id])

    @array_com_dados = []

    @tentativa.questaos.each do |questao|
      
      alternativa = questao.alternativas.where.not(explicacao: "").first

      @array_com_dados.push({
        questao: questao.enunciado,
        alternativa: alternativa
      })
      
    end  
  end
end
