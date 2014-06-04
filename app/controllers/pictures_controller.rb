class PicturesController < ApplicationController
  before_action :find_picture, only: [:show, :edit, :update, :destroy]
  before_action :attributes, only: [:update, :create]
  require 'will_paginate/array'


  def autocomplete_tags
    tags = ActsAsTaggableOn::Tag.all
    render :json => tags.map { |tag| { :label => tag.name, :value => tag.name} }
  end


  def search
    @pictures = Picture.tagged_with(params[:tags], :match_all => true)
    @pictures = @pictures.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html { render :index }
    end
  end

  def index
    @pictures = Picture.all.shuffle.paginate(:page => params[:page], :per_page => 10)
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
