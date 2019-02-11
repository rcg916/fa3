class AddClarityToReviews < ActiveRecord::Migration[5.2]
  def change
  	add_column :reviews, :clarityrating, :integer
  	add_column :reviews, :quicknessrating, :integer
  end
end
