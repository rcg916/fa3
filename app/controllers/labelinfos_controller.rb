class LabelinfosController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@review = Review.find(params[:review_id])
		@label = @review.labelinfos.create(labelinfo_params)
		if @label.valid?
			redirect_to store_review_path(store_id: @review.store.id, id: @review.id), notice: 'Awesome! Your label was added successfully.'
		else
			redirect_to store_review_path(store_id: @review.store.id, id: @review.id), alert: 'Sorry, there was a problem with your label. Please try again.'
		end
	end

	private

  def labelinfo_params
    params.require(:labelinfo).permit(:thcperc, :cbdperc, :harvestdate)
  end
end
