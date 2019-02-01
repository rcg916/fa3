class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
    	t.string :caption
    	t.integer :review_id
      t.timestamps
    end
  end
end
