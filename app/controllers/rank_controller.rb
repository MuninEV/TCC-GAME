class RankController < ApplicationController
  def index
    array =[]

    User.all.includes(:tentativas).each do |user|
      user.tentativas.each do |tentativa|
        soma = tentativa.questaos.map(&:dificuldade).map(&:pontuacao).sum unless tentativa.questaos.empty?
        array.push({
          "total": soma,
          "user": user
        }) if soma != nil
      end
    end

    dados = array.group_by{|h| h[:user]}.values

    @array2 = []
    dados.each_with_index do |value, index|
      @array2 << value.max_by {|h| h.values.first}  
    end

    @novos_dados = @array2.sort_by{|value| value[:total]}.reverse!    
  end
end
