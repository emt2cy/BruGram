class CommentsController < ApplicationController

def create
	@photo = current_user.photos.find(params[:photo_id])
	@comment = @photo.comments.create(comment_params)
	redirect_to user_photo_path(current_user, @photo)
end

def destroy
	@photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.find(params[:id])
    @comment.destroy
    redirect_to user_photo_path(current_user, @photo)
end

 private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end 
