class StoresController < ApplicationController
  before_action :authenticate_user!
  before_action :must_be_admin, only: [:new, :create]

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
  	 @store = Store.new
  end

  def create
  	@store = Store.create(store_params)
    storecapitalized = @store.storename.titlecase
    @store.update_attribute :storename, storecapitalized
    city = @store.address.split(', ')[1]
    @store.update_attribute :city, city
    sp1 = @store.address.split(', ')[2]
    state = sp1.split(" ")[0]
    @store.update_attribute :state, state
    zipcode = sp1.split(" ")[1]
    @store.update_attribute :zipcode, zipcode
		if @store.valid?
			redirect_to stores_path, notice: 'Store created successfully.'
		else
			render :new, status: :unprocessable_entity
		end
  end

  private

  def store_params
    params.require(:store).permit(:storename, :address, :city, :state, :zipcode)
  end

  def must_be_admin
    unless current_user && current_user.admin?
        redirect_to root_path, alert: 'Sorry, you must have admin access to view that page.'
    end
  end
end
