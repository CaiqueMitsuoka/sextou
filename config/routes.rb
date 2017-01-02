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
  get '/playlists/add', to: 'spotify#add_song_form'
  post '/playlists/add', to: 'spotify#add_song'
end
