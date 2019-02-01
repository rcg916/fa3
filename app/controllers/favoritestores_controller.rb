class FavoritestoresController < ApplicationController
  def update
  	favoritestore = Favoritestore.where(store: Store.find(params[:store]), user: current_user)
  	if favoritestore == []
  		# Create the Favoritestore
  		Favoritestore.create(store: Store.find(params[:store]), user: current_user)
  		@favoritestore_exists = true
  	else
  		# Delete the Favoritestore(s)
  		favoritestore.destroy_all
  		@favoritestore_exists = false
  	end
  	respond_to do |format|
  		format.html {}
  		format.js {}
  	end
  end
end
