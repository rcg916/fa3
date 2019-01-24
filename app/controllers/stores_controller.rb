class StoresController < ApplicationController
  def index
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
