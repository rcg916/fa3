class AddFieldToReviews < ActiveRecord::Migration[5.2]
  def change
  	add_column :reviews, :producttype, :string
  end
end
