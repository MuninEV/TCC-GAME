Trestle.resource(:users, model: User, scope: Auth) do

  before_action do
    if !current_user&.adm?
      redirect_to "/"
    end
  end


  menu do
    group :configuration, priority: :last do
      item :users, icon: "fas fa-users"
    end
  end

  table do
    column :nome_usuario, link: true
    actions do |a|
      a.delete unless a.instance == current_user
    end
  end

  form do |user|
    text_field :nome_usuario

    row do
      col(sm: 6) { password_field :password, label: "Senha" }
      col(sm: 6) { password_field :password_confirmation, label: "Confirmação da senha" }
    end
  end

  # Ignore the password parameters if they are blank
  update_instance do |instance, attrs|
    if attrs[:password].blank?
      attrs.delete(:password)
      attrs.delete(:password_confirmation) if attrs[:password_confirmation].blank?
    end

    instance.assign_attributes(attrs)
  end

  # Log the current user back in if their password was changed
  after_action on: :update do
    if instance == current_user && instance.encrypted_password_previously_changed?
      login!(instance)
    end
  end if Devise.sign_in_after_reset_password
end
