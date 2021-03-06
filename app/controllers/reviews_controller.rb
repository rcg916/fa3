class ReviewsController < ApplicationController
	before_action :authenticate_user!, except: [:home, :faq, :show]

  def index
  	@user = current_user
    if @user.userlocations.last == nil
      redirect_to user_path(@user), alert: 'Please set your location so we can show you reviews nearby. If you prefer, you can use your zip code.'
    else
      @nearbystores = Store.near(@user.userlocations.last.to_coordinates, 25, units: :mi)
      @nearbyreviews = []
      @nearbystores.each do |store|
        store.reviews.each do |review|
          @nearbyreviews << review
        end
      end
      @sortednearbyreviews = @nearbyreviews.sort_by { |p| p.created_at }.reverse
    end
  end

  def show
  	@user = current_user
		@review = Review.find(params[:id])
    @labelinfo = Labelinfo.new
    @photo = Photo.new
    @reviewhighfive_exists = Reviewhighfive.where(review: @review, user: current_user) == [] ? false : true
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
    @review.destroy
    redirect_to stores_path, notice: 'Your review has successfully been deleted.'
  end

  def home
    @latestreviews = Review.order('created_at DESC').limit(3)
    @latestphotos = Photo.order('created_at DESC').limit(3)
  end

  def faq
  end

  def create
    @store = Store.find(params[:store_id])
		@user = current_user
    @review = @store.reviews.create(review_params.merge(store_id: @store.id, user: @user))
    if @review.valid?
      ratingavg = ((@review.visualrating + @review.tasterating + @review.odorrating + @review.potencyrating + @review.happinessrating).to_f / 5).floor(2)
      @review.update_attribute :ratingavg, ratingavg
      straincapitalized = @review.strainname.titlecase
      @review.update_attribute :strainname, straincapitalized 
      redirect_to store_review_path(@review.store, @review), notice: 'Awesome! Your review was created successfully. Now it\'s time to add a picture and label info!'
  	else
  		redirect_to store_path(@store), alert: 'Sorry, there was a problem with your review. Please try again.'
  	end
  end

  private

  def review_params
    params.require(:review).permit(:producttype, :storetype, :title, :comment, :odorrating, 
      :visualrating, :tasterating, :potencyrating, :straintype, :strainname, :happinessrating, 
      :clarityrating, :quicknessrating, :headbodyrating, :daynightrating, :reviewdesc)
  end
end
