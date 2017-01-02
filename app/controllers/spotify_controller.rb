class SpotifyController < ApplicationController
  def home
  end
  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    # byebug
    session[:user_hash] = @spotify_user.to_hash
    redirect_to '/spotify/home'
    # Now you can access user's private data, create playlists and much more
  end

  def playlists
    spotify_user = RSpotify::User.new(session[:user_hash])
    @playlists = spotify_user.playlists
  end

  def select
    session[:current_playlist] = params.permit(:playlist)[:playlist]
    # byebug
    redirect_to '/spotify/home'
  end

  def index
    @spotify_user = RSpotify::User.new(session[:user_hash])
    if session.key?("current_playlist")
      @playlist = RSpotify::Playlist.find(@spotify_user.id , session[:current_playlist])
    end
  end

  def add_song_form
  end

  def add_song
    spotify_user = RSpotify::User.new(session[:user_hash])
    playlist = RSpotify::Playlist.find(spotify_user.id , session[:current_playlist])
    track = RSpotify::Track.find(params.permit(:track)[:track])
    if track
      playlist.add_tracks!([track])
    end
    redirect_to '/spotify/home'
  end
end
