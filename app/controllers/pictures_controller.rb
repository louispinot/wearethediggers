class PicturesController < ApplicationController
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
end
