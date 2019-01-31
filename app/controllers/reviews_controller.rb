class ReviewsController < ApplicationController
	before_action :authenticate_user!, except: [:home]

  def index
  	@reviews = Review.all
  end

  def show
  	@user = current_user
		@review = Review.find(params[:id])
    @labelinfo = Labelinfo.new
  end

  def home
  end

  def faq
  end

  def create
    @store = Store.find(params[:store_id])
		@user = current_user
    @review = @store.reviews.create(review_params.merge(store_id: @store.id, user: @user))
    if @review.valid?
    	redirect_to store_reviews_path, notice: 'Awesome! Your review was created successfully.'
  	else
  		redirect_to store_path(@store), alert: 'Sorry, there was a problem with your review. Please try again.'
  	end
  end

  private

  def review_params
    params.require(:review).permit(:producttype, :storetype)
  end
end
