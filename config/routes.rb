Rails.application.routes.draw do
  resources :users
  get '/', to: 'spotify#home'
  get '/auth/spotify/callback', to: 'spotify#spotify'
  get '/spotify/home', to: 'spotify#index'

  # Playlists
  get '/playlists', to: 'playlists#index'
  get '/playlists/select', to: 'playlists#select'
  post '/playlists/select_song', to: 'playlists#add'

  # Tracks
  get '/tracks/search', to: 'tracks#search'

  # Albums
  get '/albums', to: 'albums#search'
end
