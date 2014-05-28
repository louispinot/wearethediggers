ActiveAdmin.register User do

  index do
    column :first_name
    column :last_name
    column :email
    column :admin
    column :superuser
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    actions
  end

   # permit_params do
   #    if current_user.admin?
   #      params = [:first_name, :last_name, :email, :password, :superuser, :admin]
   #    end
   #    params
   #  end

   permit_params :first_name, :last_name, :email, :password, :superuser, :admin

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  #permit_params
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

end
