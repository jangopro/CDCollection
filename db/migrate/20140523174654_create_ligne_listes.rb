class CreateLigneListes < ActiveRecord::Migration
  def change
    create_table :ligne_listes do |t|
      t.integer :typeListe
      t.integer :album_id
      t.integer :user_id

      t.timestamps
    end
  end
end
