class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
    	t.string :storename
    	t.string :address
      t.timestamps
    end
  end
end
