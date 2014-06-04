class PicturesController < ApplicationController
  before_action :find_picture, only: [:show, :edit, :update, :destroy]
  before_action :attributes, only: [:update, :create]
  require 'will_paginate/array'


  def search
    # if params[:query] == ""
    #   @soldiers = Soldier.all
    # else
    #   if params[:query_type] == '1'
    #     @soldiers = Soldier.search_by_name_with_rank(params[:query])
    #   elsif params[:query_type] == '2'
    #     @soldiers = Soldier.search_by_service_number(params[:query])
    #   end
    # end

    # @soldiers = @soldiers.unit(params[:unit]) unless params[:unit] == ''

    # respond_to do |format|
    #   format.html { render :index }
    #   format.js { @articles }
    # end
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
