class FridayRelease < ApplicationRecord
  validates :playlist_id, :user, presence: true

  belongs_to :user

  before_validation :create_playlist

  def create_playlist
    return unless user.present? && !playlist_id.present?

    @playlist = ::Playlist::Create.new("🔥Sextou Lançamentos🔥", user).execute

    self.playlist_id = playlist.id if playlist.id.present?
  end

  def playlist
    @playlist ||= find_playlist
  end

  def find_playlist
    playlist = RSpotify::Playlist.find_by_id(playlist_id)
    playlist.owner = user.spotify_account
  end
end
