class CreatePhotoupvotes < ActiveRecord::Migration[5.2]
  def change
    create_table :photoupvotes do |t|
      t.references :photo, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
