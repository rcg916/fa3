class UserlocationsController < ApplicationController
	before_action :authenticate_user!

	def create
		@userlocation = current_user.userlocations.create(userlocation_params)
		if @userlocation.valid?
			if current_user.userlocations.count > 1
				redirect_to user_path(current_user), 
				notice: 'Your location has been updated successfully.'
			else
				redirect_to stores_path, 
				notice: 'Your location has been updated successfully. If you need a hand with anything, visit our <%= link_to "FAQ", reviews_faq_path %>'
			end
		else
			redirect_to user_path(current_user), 
			alert: 'Sorry, there was a problem setting your location. Please try again.'
		end
	end

	private

	def userlocation_params
		params.require(:userlocation).permit(:address)
	end
end
