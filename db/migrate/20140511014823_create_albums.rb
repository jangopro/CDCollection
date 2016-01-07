class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :anneeSortie
      t.integer :artiste_id
      t.integer :typeAlbum
      t.timestamps
    end
  end
end
