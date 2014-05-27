ActiveAdmin.register User do

  index do
    column :email
    column :admin
    column :superuser
    column :first_name
    column :last_name

    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    actions
  end


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

end
