class Album < ActiveRecord::Base
  ALBUM_TYPES = ["live", "studio"]

  validates :name, :band_id, :album_type, presence: true
  validates :name, uniqueness: { scope: :band_id }
  validates :album_type, inclusion: { in: ALBUM_TYPES }
  
  has_many :tracks, dependent: :destroy
  belongs_to :band
end
