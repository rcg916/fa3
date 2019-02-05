class Admin::DashboardController < ApplicationController
	before_action :authenticate_user!
	before_action :must_be_admin

	def index
	  	@user = current_user
	end

	private

	def must_be_admin
		unless current_user && current_user.admin?
	  	 	redirect_to root_path, alert: 'Sorry, you must have admin access to view that page.'
    	end
	end
end
