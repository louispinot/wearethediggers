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
