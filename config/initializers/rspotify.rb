# Initialize RSpotify authentication
unless Rails.env.test?
  RSpotify::authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_SECRET_ID"])
end
