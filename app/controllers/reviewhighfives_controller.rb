class ReviewhighfivesController < ApplicationController
  def update
  	reviewhighfive = Reviewhighfive.where(review: Review.find(params[:review]), user: current_user)
  	if reviewhighfive == []
  		# Create the high five
  		Reviewhighfive.create(review: Review.find(params[:review]), user: current_user)
  		@reviewhighfive_exists = true
  	else
  		# delete the high five(s)
  		reviewhighfive.destroy_all
  		@reviewhighfive_exists = false
  	end
  	respond_to do |format|
  		format.html {}
  		format.js {}
  	end
  end
end
