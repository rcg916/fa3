class ReviewsController < ApplicationController
  def index
  	@reviews = Review.all
  end

  def home
  end

  def new
  	@review = Review.new
  end

  def create
    @store = Store.find(params[:store_id])
		# @user = current_user
    @review = @store.reviews.create(review_params.merge(store_id: @store.id))
    if @review.valid?
    	redirect_to root_path, notice: 'Awesome! Your review was created successfully.'
  	else
  		redirect_to root_path, alert: 'Sorry, there was a problem with your review. Please try again.'
  	end
  end

  private

  def review_params
    params.require(:review).permit(:producttype)
  end
end
