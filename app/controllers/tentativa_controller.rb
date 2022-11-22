class TentativaController < ApplicationController
  before_action :usuario_logado?, only: [:index]
  def index
  end
end
