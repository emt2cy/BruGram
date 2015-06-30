class PhotosController < ApplicationController
	before_action :authenticate_user!

	def index
		user = User.find(params[:user_id]).to_i
		if current_user.id == user
		@photos = current_user.photos
	else
		@photos = user.photos.where(public:true)
	end 

	def new
		@photo = current_user.photos.build
	end 

	def create
		@photo = current_user.photos.build(photo_params)

		if @photo.save
			redirect_to @photo
		else
			render 'new'
		end
	end

	def show_all
		@photos = Photo.where(public: true)
	end

private
	def photo_params
		params.require(:photo).permit(:caption)
end

end
