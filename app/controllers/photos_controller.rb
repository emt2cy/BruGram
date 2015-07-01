class PhotosController < ApplicationController
	before_action :authenticate_user!, :except => [:show_all]

	def show_all
		@photos = Photo.where(public: true)
	end

	def index
		@photos = current_user.photos
	end

	def show
		@photo = current_user.photos.find(params[:id])
	end

	def new
		@photo = current_user.photos.build
	end 

	def create
		@photo = current_user.photos.build(photo_params)

		if @photo.save
			redirect_to user_photos_path
		else
			render 'photos/index'
		end
	end

	def edit
		@photo = current_user.photos.find(params[:id])
	end

	def update
		@photo = current_user.photos.find(params[:id])

		if @photo.update(photo_params)
			redirect_to user_photo_path(current_user, @photo)
		else
			render 'edit'
		end
	end

	def destroy
		@photo = current_user.photos.find(params[:id])
		@photo.destroy

		redirect_to user_photos_path
	end

private
	def photo_params
		params.require(:photo).permit(:public, :caption, :image)
	end

end
