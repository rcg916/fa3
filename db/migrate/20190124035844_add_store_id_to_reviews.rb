class AddStoreIdToReviews < ActiveRecord::Migration[5.2]
  def change
  	add_column :reviews, :store_id, :integer
  end
end
