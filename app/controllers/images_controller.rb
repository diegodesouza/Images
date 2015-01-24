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

    if @image.save
      flash[:notice] = "Here is a treat."
      redirect_to image_path(@image)
    else
      flash[:alert] = "No cookies for you."
      render :new
    end
  end

  private

  def images_params
    params.require(:image).permit(:admin_id, :description, :photo)
  end
end
