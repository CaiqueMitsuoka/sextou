class PlaylistsController < ApplicationController
  def index
    @playlists = current_user.playlists
  end

  def select
    session[:current_playlist] = params.require(:playlist)
    redirect_to '/spotify/home'
  end

  def add
    add_track(params.require(:track))
    redirect_to '/spotify/home'
  end

  private
  def add_track(track_id)
      track = RSpotify::Track.find(track_id)
      current_playlist.add_tracks!([track])
  end
end
