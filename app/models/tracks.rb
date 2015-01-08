class Track < ActiveRecord::Base
  validates :song_title, :track_id, presence: true
  validates :song_title, uniqueness: { scope: :track_id }
  belongs_to :album
end
