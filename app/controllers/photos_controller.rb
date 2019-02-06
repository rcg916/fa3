class PhotosController < ApplicationController
	before_action :authenticate_user!

	def index
		@photos = Photo.all
	end

	def show
		@review = Review.find(params[:review_id])
		@photoupvote_exists = Photoupvote.where(photo: @review.photos.last, user: current_user) == [] ? false : true
	end

	def destroy
	  @review = Review.find(params[:id])
	  if @review.user != current_user
	    return render plain: 'Not Allowed', status: :forbidden
	  end
	  @review.photos.destroy_all
	  redirect_to store_review_path(@review), notice: 'Your photo has been deleted.'
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
