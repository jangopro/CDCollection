class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :anneeSortie

      t.timestamps
    end
  end
end
