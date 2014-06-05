class PicturesController < ApplicationController
  before_action :find_picture, only: [:show, :edit, :update, :destroy]
  before_action :attributes, only: [:update, :create]
  require 'will_paginate/array'

  def index
    if session[:pictures_ids].nil?
      session[:pictures_ids] = Picture.order('random()').all.map(&:id)
    end
    @pictures = Picture.where(id: session[:pictures_ids]).all.paginate(:page => params[:page], :per_page => 50)
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
