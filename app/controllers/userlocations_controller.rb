class UserlocationsController < ApplicationController
	before_action :authenticate_user!

	def create
		@userlocation = current_user.userlocations.create(userlocation_params)
		if @userlocation.valid?
			redirect_to user_path(current_user), 
			notice: 'Your location has been updated successfully.'
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
