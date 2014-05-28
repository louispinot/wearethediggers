ActiveAdmin.register Soldier do

#http://code.tutsplus.com/tutorials/create-beautiful-administration-interfaces-with-active-admin--net-21729
  index do
    column :first_name
    column :last_name
    column :service_number
    column :rank
    column :unit
    column :source
    column :created_at
    column :updated_at
    actions

  end

  # permit_params do
  #     params = [:bio]
  #     if current_user.admin?
  #       params.push(:first_name, :last_name, :service_number, :rank, :unit, :date_of_death, :place_of_death, :cemetery, :source)
  #     end
  #     params
  #   end
  permit_params :first_name, :last_name, :service_number, :rank, :unit, :date_of_death, :place_of_death, :cemetery, :source, :bio

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
