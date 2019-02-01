class StoresController < ApplicationController
  before_action :authenticate_user!
  # before_action :must_be_admin, only: [:new, :create]

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
  end

  def new
  	@store = Store.new
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
