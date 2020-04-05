class SpotifyController < ApplicationController
  def home
  end

  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    session[:user_hash] = @spotify_user.to_hash
    redirect_to '/spotify/home'
  end

  def index
    @spotify_user = current_user
    if session.key?("current_playlist")
      @playlist = current_playlist
    end
  end
end
