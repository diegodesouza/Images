class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
    @comments = Comment.where(image_id: @image.id)
  end

  def new
    @image = Image.new
    @comment = Comment.new
  end

  def create
    @image = Image.new(images_params)
    @image.user = current_user

    if @image.save
      flash[:notice] = "Here is a treat."
      redirect_to image_path(@image)
    else
      flash[:alert] = "No cookies for you."
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])

    if @image.update(images_params)
      flash[:notice] = "Image updated successfully"
      redirect_to image_path(@image)
    else
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])
    if @image.destroy
      flash[:notice] = "Image deleted"
      redirect_to images_path
    end
  end

  private

  def images_params
    params.require(:image).permit(:admin_id, :title, :description, :photo, :comment_id)
  end
end
