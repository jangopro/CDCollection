class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :id_album
      t.integer :rating
      t.integer :id_user

      t.timestamps
    end
  end
end
