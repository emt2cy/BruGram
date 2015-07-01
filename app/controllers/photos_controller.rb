class PhotosController < ApplicationController
	before_action :authenticate_user!

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

	def show_all
		@photos = Photo.where(public: true)
	end

private
	def photo_params
		params.require(:photo).permit(:public, :caption, :image)
	end

end
