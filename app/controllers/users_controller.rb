class UsersController < ApplicationController
	before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
  	@userlocation = Userlocation.new
  end
end
