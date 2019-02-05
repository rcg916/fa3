class StoresController < ApplicationController
  before_action :authenticate_user!

  def index
  	@user = current_user
    if @user.userlocations.last == nil
      redirect_to user_path(@user), alert: 'Please set your location so we can show you reviews nearby.'
    else
      @nearbystores = Store.near(@user.userlocations.last.to_coordinates, 25, units: :mi)
    end
  end

  def show
  	@store = Store.find(params[:id])
		@review = Review.new
    @favoritestore_exists = Favoritestore.where(store: @store, user: current_user) == [] ? false : true
  end

  def new
    if current_user && current_user.admin?
  	 @store = Store.new
    else
      redirect_to stores_path, alert: 'Sorry, you must have admin access to view that page.'
    end
  end

  def create
  	@store = Store.create(store_params)
		if @store.valid?
			redirect_to stores_path, notice: 'Store created successfully.'
		else
			render :new, status: :unprocessable_entity
		end
  end

  private

  def store_params
    params.require(:store).permit(:storename, :address)
  end
end
