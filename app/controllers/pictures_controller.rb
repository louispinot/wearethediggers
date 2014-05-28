class PicturesController < ApplicationController
  before_action :find_picture, only: [:show, :edit, :update, :destroy]
  before_action :attributes, only: [:update, :create]


  def index
    @pictures = Picture.all
    authorize @pictures
  end

  def show
    authorize @picture
  end

  def new
    authorize @picture
  end

  def edit
    authorize @picture
  end

  def update
    authorize @picture
  end

  def create
    authorize @picture
  end

  def destroy
    authorize @picture
  end

  private

  def find_picture
    @picture = Picture.find(params[:id])
  end

  def attributes
    attributes = params.require(:picture).permit(:picture_url, :ref, :author, :place, :copyrights_owner, :description, :date)
  end

end
