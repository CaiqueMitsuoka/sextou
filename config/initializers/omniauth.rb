require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :spotify, ENV['SPOTIFY_CLIENT_ID'],ENV['SPOTIFY_SECRET_ID'], scope: 'user-read-email playlist-modify-public playlist-modify-private user-library-read user-library-modify user-follow-read'
end

module OmniAuth
  module Strategies
    class Spotify < OmniAuth::Strategies::OAuth2
      def callback_url
        if @authorization_code_from_signed_request_in_cookie
          ''
        else
          # Fixes regression in omniauth-oauth2 v1.4.0 by https://github.com/intridea/omniauth-oauth2/commit/85fdbe117c2a4400d001a6368cc359d88f40abc7
          # Spotify returns "Invalid redirect URI" if the `redirect_url` contains a query string
          options[:callback_url] || (full_host + script_name + callback_path)
        end
      end
    end
  end
end
