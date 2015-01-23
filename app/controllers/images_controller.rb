class ImagesController < ApplicationController
  def index
    @images = Image.all
  end
  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(images_params)
  end
end
