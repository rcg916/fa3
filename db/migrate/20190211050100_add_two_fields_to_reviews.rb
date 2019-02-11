class AddTwoFieldsToReviews < ActiveRecord::Migration[5.2]
  def change
  	add_column :reviews, :daynightrating, :integer
  	add_column :reviews, :headbodyrating, :integer
  end
end
