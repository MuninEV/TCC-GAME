class PontuacaoController < ApplicationController
  def pontuacao
    @valor = params[:valor].freeze
  end
end
