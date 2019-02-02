class AddCommentToReviews < ActiveRecord::Migration[5.2]
  def change
  	add_column :reviews, :comment, :text
  	add_column :reviews, :visualrating, :integer
  	add_column :reviews, :odorrating, :integer
  	add_column :reviews, :tasterating, :integer
  end
end
