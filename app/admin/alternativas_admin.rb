Trestle.resource(:alternativas) do
  # Customize the table columns shown on the index view.
  #
   table do
     column :descricao_resposta
     column :correto
     actions
   end

  # Customize the form fields shown on the new/edit views.
  #
  form do |alternativa|
   text_field :descricao_resposta
   check_box :correto
   hidden_field :questao_ids, value: params[:questao_id]
  end

  controller do

    before_action :posso_criar_alternativa?, only: [:create]

    def create
     if !posso_criar_alternativa?
      @alternativa = Alternativa.new(alternativas_params.except(:questao_ids))
      @alternativa.save
      QuestaoAlternativa.create(questao_id: questao.id, alternativa_id: @alternativa.id)


      flash[:message] = flash_message("create.success", title: "Success!", message: "Alternativa associada com sucesso")


      if questao.alternativas.count == 4
        return redirect_to new_alternativas_admin_path(questao_id: questao.id)
      end

      redirect_to new_alternativas_admin_path(questao_id: questao.id)

     else
      redirect_to questions_admin_path(question.id)
     end
    end

    def posso_criar_alternativa?
      return redirect_to questaos_admin_path(questao.id) if questao.alternativas.count == 4

      false
    end

    private

    def questao
      @questao ||= Questao.find(alternativas_params[:questao_ids] || params[:questao_id])
    end

    def alternativas_params
      params.require(:alternativa).permit(:descricao_resposta, :correto, :questao_ids)
    end
  end
end
