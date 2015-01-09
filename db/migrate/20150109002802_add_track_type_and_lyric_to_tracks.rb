class AddTrackTypeAndLyricToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :track_type, :string, null: false
    add_column :tracks, :lyric, :text
  end
end
