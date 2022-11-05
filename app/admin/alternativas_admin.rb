Trestle.resource(:alternativas) do
  
   table do
     column :descricao
     column :correto
   end

  form do |alternativa|
   text_field :descricao,  label: "Descrição"
   check_box :correto, label: "Resposta correta?"
   hidden_field :questao_ids, value: params[:questao_id]
  end

  controller do

    before_action :posso_criar_alternativa?, only: [:create]

    def create
     if !posso_criar_alternativa?
      @alternativa = Alternativa.new(alternativas_params.except(:questao_ids))
      @alternativa.save
      QuestaoAlternativa.create(questao_id: questao.id, alternativa_id: @alternativa.id)


      flash[:message] = flash_message("create.success", title: "Success!", message: "The %{lowercase_model_name} was successfully created.")


      if questao.alternativas.count == 4
        return redirect_to new_alternativas_admin_path(questao_id: questao.id)
      end

      return redirect_to new_alternativas_admin_path(questao_id: questao.id)

     end

     redirect_to questions_admin_path(questao.id)
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
      params.require(:alternativa).permit(:descricao, :correto, :questao_ids)
    end
  end
end
