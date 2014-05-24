class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :album_id
      t.decimal :rating
      t.integer :user_id

      t.timestamps
    end
  end
end
