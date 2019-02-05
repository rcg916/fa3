class AddPotencyToReviews < ActiveRecord::Migration[5.2]
  def change
  	add_column :reviews, :potencyrating, :integer
  end
end
