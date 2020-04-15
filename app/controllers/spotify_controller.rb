class SpotifyController < ApplicationController
  before_action :set_spotify_user, only: :spotify

  def home; end

  def spotify
    spotify_user = create_or_update
    session[:current_user_id] = spotify_user.is_a?(Array) ? spotify_user.last.id : spotify_user.id
    redirect_to '/spotify/home'
  end

  def index
    @playlist = current_playlist if session.key?('current_playlist')
  end

  private

  def user_exists?
    User.exists?(session_id: @spotify_user.id)
  end

  def create_or_update
    return User.update(user_raw: @spotify_user.to_hash) if user_exists?

    User.create(name: @spotify_user.display_name, user_raw: @spotify_user.to_hash, session_id: @spotify_user.id)
  end

  def set_spotify_user
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
  end
end
