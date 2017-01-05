Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'spotify#home'
  # get '/spotify/callback', to: 'spotify#spotify'
  get '/auth/spotify/callback', to: 'spotify#spotify'
  # get '/provider/spotify', to: 'spotify#spotify'
  get '/playlists', to: 'spotify#playlists'
  get '/spotify/home', to: 'spotify#index'
  get '/playlists/select', to: 'spotify#select'
  get '/playlists/select_song', to: 'spotify#select_song'
  get '/playlists/add_uri', to: 'spotify#add_song_form_uri'
  get '/playlists/add_name', to: 'spotify#add_song_form_name'
  post '/playlists/add_uri', to: 'spotify#add_song_uri'
  post '/playlists/add_name', to: 'spotify#add_song_name'


  post '/albums', to: 'spotify#search_album'
end
