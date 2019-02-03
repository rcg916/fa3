class AddAvgToReviews < ActiveRecord::Migration[5.2]
  def change
  	add_column :reviews, :ratingavg, :float
  end
end
