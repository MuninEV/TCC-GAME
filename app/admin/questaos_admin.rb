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
    column :created_at, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |questao|
    text_field :descricao, label: "Enunciado da questão"

  
    row do
      dificuldade = Dificuldade.all.map {|dificuldade| [dificuldade.nivel, dificuldade.id] }
      col(sm: 6) { select :dificuldade_id, dificuldade, label: "Selecione a dificuldade" }
    end

    row do
      if !questao.alternativas.empty?
        table questao.alternativas, admin: "/alternativas" do 
          column  :descricao_resposta
          column  :correto
          actions
        end
      end
    end
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:questao).permit(:name, ...)
  # end
end
