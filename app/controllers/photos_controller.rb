class PhotosController < ApplicationController
	before_action :authenticate_user!

	def index
		@photos = Photo.all.order("created_at DESC")
	end

	def create
		@review = Review.find(params[:review_id])
		@photo = @review.photos.create(photo_params)
		if @photo.valid?
			redirect_to store_review_path(store_id: @review.store.id, id: @review.id), 
			notice: 'Sweet! Your photo has been uploaded successfully.'
		else
			redirect_to store_review_path(store_id: @review.store.id, id: @review.id), 
			alert: 'Sorry, there was a problem uploading your photo. Please try again.'
		end
	end

	private

	def photo_params
		params.require(:photo).permit(:picture, :caption)
	end
end
