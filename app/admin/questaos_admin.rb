Trestle.resource(:questaos) do

  before_action do
    if !current_user&.adm?
      redirect_to "/"
    end
  end

  menu do
    group "Nutrição do sistema", priority: :first do
      item :questaos, icon: "fa fa-question", label: "Questões"
    end
  end
  
  table do
    column :enunciado
    column :dificuldade, -> (questao) { questao.dificuldade.nivel }, align: :center
    actions
  end

  form class: "form-group" do |questao|
    text_field :enunciado, label: "Enunciado"
    row do
      dificuldade = Dificuldade.all.map {|dificuldade| [dificuldade.nivel, dificuldade.id] }
      col(sm: 12) { select :dificuldade_id, dificuldade, label: "Selecione a dificuldade" }
    end

    if questao.alternativas.exists?
      concat(content_tag(:br))
    
      row do
        col(lg: 12) do 
          table questao.alternativas, admin: :alternativas, class: "table" do 
            column :descricao
            column :correto, align: :center

            actions do |toolbar, instance, _|
              toolbar.delete
            end
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
      params.require(:questao).permit(:enunciado, :dificuldade_id)
    end
  end
end
