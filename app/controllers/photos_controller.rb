class PhotosController < ApplicationController
	before_action :authenticate_user!

	def create
		@review = Review.find(params[:review_id])
		@photo = @review.photos.create(photo_params)
		if @photo.valid?
			redirect_to store_review_path(store_id: @review.store.id, id: @review.id), 
			notice: 'Your photo has been updated successfully.'
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
