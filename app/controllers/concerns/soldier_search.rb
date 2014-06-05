module SoldierSearch
  extend ActiveSupport::Concern

  def search_soldiers
    if params[:name_query] == ''
      soldiers = Soldier.all
    else
      soldiers = Soldier.search_by_name(params[:name_query]) unless params[:name_query] == ''
    end
    soldiers = soldiers.service_number(params[:service_number]) unless params[:service_number] == ''
    soldiers = soldiers.unit(params[:unit]) unless params[:unit] == ''
    soldiers = soldiers.rank(params[:rank]) unless params[:rank] == ''
    soldiers
  end
end