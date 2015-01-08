class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.string :song_title, null: false
    end
    
    add_index :tracks, [:album_id, :song_title], unique: true
  end
end
