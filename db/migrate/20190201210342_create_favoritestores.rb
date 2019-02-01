class CreateFavoritestores < ActiveRecord::Migration[5.2]
  def change
    create_table :favoritestores do |t|
      t.references :store, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
