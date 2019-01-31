class CreateUserlocations < ActiveRecord::Migration[5.2]
  def change
    create_table :userlocations do |t|
    	t.string :address
    	t.float :longitude
    	t.float :latitude
    	t.integer :user_id
      t.timestamps
    end
  end
end
