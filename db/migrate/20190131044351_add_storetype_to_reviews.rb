class AddStoretypeToReviews < ActiveRecord::Migration[5.2]
  def change
  	add_column :reviews, :storetype, :string
  end
end
