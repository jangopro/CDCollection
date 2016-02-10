class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :album_id
      t.column(:rating, :decimal ,precision: 2, scale: 1)
      t.integer :user_id

      t.timestamps
    end
  end
end
