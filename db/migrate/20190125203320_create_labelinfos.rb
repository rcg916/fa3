class CreateLabelinfos < ActiveRecord::Migration[5.2]
  def change
    create_table :labelinfos do |t|
    	t.float :thcperc
    	t.float :cbdperc
    	t.string :harvestdate
    	t.integer :review_id
      t.timestamps
    end
  end
end
