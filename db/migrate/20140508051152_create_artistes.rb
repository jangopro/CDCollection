class CreateArtistes < ActiveRecord::Migration
  def change
    create_table :artistes do |t|
      t.column :nom, :string

      t.timestamps
    end
  end
end
