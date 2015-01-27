class CommentsController < ApplicationController
  def new
    @image = Image.find(params[:image_id])
    @comment = Comment.new
  end

  def create
    @image = Image.find(params[:image_id])
    @comment = Comment.new(comment_params)
    @comment.image_id = @image.id

    if @comment.save
      flash[:notice] = "Comment successfully created"
      redirect_to image_path(@image)
    else
      redirect_to new_image_comment_path(@image, @comment)
    end
  end

  def edit
    @image = Image.find(params[:image_id])
    @comment = @image.comments.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      flash[:notice] = "Comment successfully updated"
      redirect_to image_path(params[:image_id])
    else
      flash[:alert] = "Please try again!"
      redirect_to edit_image_comment_path(@image)
    end
  end

  def destroy
    @image = Image.find(params[:image_id])
    @comment = Comment.find(params[:id])
    flash[:notice] = "Comment successfully deleted"
    redirect_to image_path(@image)
  end

  private

  def comment_params
    params.require(:comment).permit(:admin_id, :image_id, :description)
  end
end
