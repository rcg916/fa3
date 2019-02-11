class AddHappinessToReviews < ActiveRecord::Migration[5.2]
  def change
  	add_column :reviews, :happinessrating, :integer
  end
end
