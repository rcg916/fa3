class PhotoupvotesController < ApplicationController
  def update
    photoupvote = Photoupvote.where(photo: Photo.find(params[:photo]), user: current_user)
    if photoupvote == []
      # Create the Photoupvote
      Photoupvote.create(photo: Photo.find(params[:photo]), user: current_user)
      @photoupvote_exists = true
    else
      # Delete the Favoritestore(s)
      photoupvote.destroy_all
      @photoupvote_exists = false
    end
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end
end
