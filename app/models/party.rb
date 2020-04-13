class Party < ApplicationRecord
  extend FriendlyId
  belongs_to :user

  friendly_id :name, use: :slugged

  def spotify_user
    RSpotify::User.new(JSON.parse(user.user_raw))
  end

  def playlist
    RSpotify::Playlist.find(spotify_user.id, playlist_id)
  end

  def add_tracks(track_id)
    track = find_track(track_id)
    playlist.add_tracks!([track])
  end

  def find_track(track_id)
    RSpotify::Track.find(track_id)
  end
end
