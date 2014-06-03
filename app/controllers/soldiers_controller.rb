class SoldiersController < ApplicationController
  before_action :find_soldier, only: [:show, :edit, :update, :destroy]
  before_action :attributes, only: [:update, :create]

  def autocomplete_name
    soldiers = Soldier.search_by_name(params[:term])
    render :json => soldiers.map { |soldier| { :id => soldier.id, :label => "#{soldier.rank} #{soldier.full_name}"  , :value => soldier.full_name } }
  end

  def autocomplete_unit
    soldiers = Soldier.filter_by_unit(params[:term])
    units = soldiers.map {|soldier| soldier.unit}
    units = units.uniq!
    render :json => units.map { |unit| { :label => unit, :value => unit} }
  end

  def autocomplete_rank
    soldiers = Soldier.filter_by_rank(params[:term])
    ranks = soldiers.map {|soldier| soldier.rank}
    ranks = ranks.uniq!
    render :json => ranks.map { |rank| { :label => rank, :value => rank} }
  end

  def index
    @soldiers = Soldier.all
    authorize @soldiers
  end

  def search
    if (params[:name_query] == "" && params[:service_number] == "")
      @soldiers = Soldier.all
    else
      if (params[:name_query] != "" && params[:service_number] == "")
        @soldiers = Soldier.search_by_name(params[:name_query])
      elsif (params[:name_query] == "" && params[:service_number] != "")
        @soldiers = Soldier.search_by_service_number(params[:service_number])
      end
    end

    @soldiers = @soldiers.unit(params[:unit]) unless params[:unit] == ''
    @soldiers = @soldiers.rank(params[:rank]) unless params[:rank] == ''

    respond_to do |format|
      format.html { render :index }
      format.js { @articles }
    end
  end

  def show
    authorize @soldier
  end

  def edit
    authorize @soldier
  end

  def update
    authorize @soldier
    @soldier.update!(attributes)
    redirect_to soldier_path(@soldier)
  end

  def new
    authorize @soldier
  end

  def create
    authorize @soldier
    Soldier.create(attributes)

  end

  def destroy
    authorize @soldier
    @soldier.destroy
  end

  private

  def find_soldier
    @soldier = Soldier.find(params[:id])
  end

  def attributes
    attributes = params.require(:soldier).permit(:first_name, :last_name, :service_number, :rank, :unit, :date_of_death, :place_of_death, :cemetery, :source, :bio)
  end

end

