class Party < ApplicationRecord
  extend FriendlyId
  belongs_to :user

  friendly_id :name, use: :slugged

  def playlist
    RSpotify::Playlist.find(user.spotify_account.id, playlist_id)
  end

  def add_tracks(track_id)
    track = find_track(track_id)
    playlist.add_tracks!([track])
  end

  def find_track(track_id)
    RSpotify::Track.find(track_id)
  end
end
