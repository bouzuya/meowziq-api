class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :artwork_url
      t.string :title
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
