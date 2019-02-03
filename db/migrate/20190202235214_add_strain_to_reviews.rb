class AddStrainToReviews < ActiveRecord::Migration[5.2]
  def change
  	add_column :reviews, :strainname, :string
  	add_column :reviews, :straintype, :string
  end
end
