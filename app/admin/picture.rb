ActiveAdmin.register Picture do
  index do
    column :picture_url
    column :ref

    column :updated_at
    actions

  end

  # permit_params do
  #     params = [:description]
  #     if current_user.admin?
  #       params.push(:picture_url, :ref, :author, :place, :copyrights_owner, :date)
  #     end
  #     params
  #   end
  permit_params :picture_url, :ref, :author, :place, :copyrights_owner, :description, :date

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

end
