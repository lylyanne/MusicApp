class Track < ActiveRecord::Base
  TRACK_TYPES = ["bonus", "regular"]

  validates :song_title, :album_id, :track_type, presence: true
  validates :track_type, inclusion: { in: TRACK_TYPES }
  validates :song_title, uniqueness: { scope: :album_id }
  validates :lyric, length: { maximum: 500 }
  belongs_to :album
end
