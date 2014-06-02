class SoldiersController < ApplicationController
  before_action :find_soldier, only: [:show, :edit, :update, :destroy]
  before_action :attributes, only: [:update, :create]

  def index
    @soldiers = Soldier.all
    authorize @soldiers
  end

  def search
    # if params[:query] == "" && params[:service_number] == ""
    #   @soldiers = Soldier.all
    if params[:query] == ""
      @soldiers = Soldier.all
    else
      if params[:query_type] == '1'
        @soldiers = Soldier.search_by_name_with_rank(params[:query])
      elsif params[:query_type] == '2'
        @soldiers = Soldier.search_by_service_number(params[:query])
      end
    end

    @soldiers = @soldiers.unit(params[:unit]) unless params[:unit] == ''

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

