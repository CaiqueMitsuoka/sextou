class SpotifyController < ApplicationController
  before_action :set_spotify_user, only: :spotify

  attr_accessor :spotify_user

  def new; end

  def spotify
    user = create_or_update

    session[:user_id] = user.id

    redirect_to "/"
  end

  private

  def user_exists?
    User.exists?(session_id: @spotify_user.id)
  end

  def create_or_update
    if user_exists?
      @current_user = User.find_by(session_id: @spotify_user.id)
      current_user.update!(user_raw: @spotify_user.to_hash)

      current_user
    else
      User.create(name: @spotify_user.display_name, user_raw: @spotify_user.to_hash, session_id: @spotify_user.id)
    end
  end

  def set_spotify_user
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
  end
end
