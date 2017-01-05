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
    redirect_to '/spotify/home'
  end

  def add_track_playlist track_id
      spotify_user = RSpotify::User.new(session[:user_hash])
      playlist = RSpotify::Playlist.find(spotify_user.id , session[:current_playlist])
      track = RSpotify::Track.find(track_id)
      playlist.add_tracks!([track])
  end

  def select_song
      add_track_playlist(params.require(:track))
      redirect_to '/spotify/home'
  end

  def index
    @spotify_user = RSpotify::User.new(session[:user_hash])
    if session.key?("current_playlist")
      @playlist = RSpotify::Playlist.find(@spotify_user.id , session[:current_playlist])
    end
  end

  def add_song_form_uri
  end

  def add_song_uri
      add_track_playlist(params.require(:track))
      redirect_to '/spotify/home'
  end

  def index_songs
  end

  def add_song_name
    spotify_user = RSpotify::User.new(session[:user_hash])
    @tracks = RSpotify::Track.search(params.require(:track))
  end

  def search_album
    spotify_user = RSpotify::User.new(session[:user_hash])
    @albums = RSpotify::Albums.search(params.require(:album))
  end
end
