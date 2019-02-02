class ApplicationController < ActionController::Base
	def favoritestore_text
		return @favoritestore_exists ? "UnFavorite" : "Favorite"
	end

	def photoupvote_text
		return @photoupvote_exists ? "Remove UpVote" : "UpVote"
	end

	helper_method :favoritestore_text
	helper_method :photoupvote_text
end
