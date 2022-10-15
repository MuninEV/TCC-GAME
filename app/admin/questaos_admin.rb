Trestle.resource(:questaos) do
  menu do
    group "Nutrição do sistema", priority: :first do
      item :questaos, icon: "fa fa-question"
    end
  end

  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  # Customize the form fields shown on the new/edit views.
  #
  form do |questao|
    editor :descricao, label: "Descriçao da questão"
  
    row do
      dificuldade = Dificuldade.all.map {|dificuldade| [dificuldade.nivel, dificuldade.id] }
      alternativa = Alternativa.all.map {|alternativa| [alternativa.descricao_resposta, alternativa.id] }
      col(sm: 6) { select :dificuldade_id, dificuldade, label: "Selecione a dificuldade" }
      col(sm: 6) { select :alternativa_correta_id, alternativa }
    end

    row do 
      col(sm: 12) { collection_select :alternativas_ids, Alternativa.all, :id, :descricao_resposta, {:prompt => "Selecione a alternativa"}, {:multiple => true}}
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
