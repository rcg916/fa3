class AddCityToStores < ActiveRecord::Migration[5.2]
  def change
  	add_column :stores, :city, :string
  	add_column :stores, :state, :string
  	add_column :stores, :zipcode, :string
  end
end
