class CreateSonggenres < ActiveRecord::Migration[5.2]
  def change
    create_table :song_genres do |t|
      t.integer :genre_id
      t.integer :song_id
      t.string :name
    end
  end
end
