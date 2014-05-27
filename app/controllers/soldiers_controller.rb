class SoldiersController < ApplicationController
  before_action :find_soldier, only: [:show, :edit, :update, :destroy]
  before_action :attributes, only: [:update, :create]

  def index
    @soldiers = Soldier.all
  end

  def show
  end

  def edit
  end

  def update
    @soldier(attributes)
  end

  def new
  end

  def create
    Soldier.create(attributes)
  end

  def destroy
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

