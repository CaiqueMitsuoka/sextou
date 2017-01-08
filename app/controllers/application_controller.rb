class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def current_user
    @user ||= RSpotify::User.new(session[:user_hash])
  end

  def current_playlist
    @playlist ||= RSpotify::Playlist.find(current_user.id , session[:current_playlist])
  end
end
