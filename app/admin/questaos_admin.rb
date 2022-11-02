Trestle.resource(:questaos) do
  menu do
    group "Nutrição do sistema", priority: :first do
      item :questaos, icon: "fa fa-question"
    end
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :descricao
    column :dificuldade, -> (questao) { questao.dificuldade.nivel }, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form class: "form-group" do |questao|
    text_field :descricao, label: "Enunciado da questão"
    row do
      dificuldade = Dificuldade.all.map {|dificuldade| [dificuldade.nivel, dificuldade.id] }
      col(sm: 12) { select :dificuldade_id, dificuldade, label: "Selecione a dificuldade" }
    end

    if questao.alternativas.exists?
      concat(content_tag(:br))
    
      row do
        col(lg: 12) do 
          table questao.alternativas, admin: :alternativas, class: "table" do 
            column :descricao_resposta
            column :correto

            actions
          end 

          if questao.alternativas.count < 4
            concat admin_link_to("Adicionar alternativas", admin: :alternativas, action: :new, params: {questao_id: questao.id}, class: "btn btn-primary mt-2")
          end

        end
      end
    end
  end

  controller do 

    def create
      @questao = Questao.new(questaoes_params)
      if @questao.save
        redirect_to new_alternativas_admin_path(questao_id: @questao.id)
      end      
    end
    
    private

    def questaoes_params
      params.require(:questao).permit(:descricao, :dificuldade_id)
    end
  end
end
