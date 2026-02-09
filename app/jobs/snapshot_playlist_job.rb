class SnapshotPlaylistJob < ApplicationJob
  queue_as :spotify
  retry_on StandardError, wait: 5.seconds, attempts: 2

  def perform(user_id, playlist_id)
    user = User.find(user_id)
    playlist = RSpotify::Playlist.find_by_id(playlist_id)

    Playlist::Copy.new(user, playlist).execute!
  end
end
