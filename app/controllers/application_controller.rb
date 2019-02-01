class ApplicationController < ActionController::Base
	def favoritestore_text
		return @favoritestore_exists ? "UnFavorite" : "Favorite"
	end

	helper_method :favoritestore_text
end
