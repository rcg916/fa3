class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?
	
	protected

	def configure_permitted_parameters
	 devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
	 devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
	 devise_parameter_sanitizer.permit(:account_update, keys: [:username])
	end

	def favoritestore_text
		return @favoritestore_exists ? "UnFavorite" : "Favorite"
	end

	def photoupvote_text
		return @photoupvote_exists ? "Remove UpVote" : "UpVote"
	end

	def reviewhighfive_text
		return @reviewhighfive_exists ? "Remove High Five" : "High Five!"
	end

	helper_method :favoritestore_text
	helper_method :photoupvote_text
	helper_method :reviewhighfive_text
end
