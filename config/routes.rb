Rails.application.routes.draw do

  resources :users
  get '/', to: 'spotify#home'
  get '/auth/spotify/callback', to: 'spotify#spotify'
  get '/spotify/home', to: 'spotify#index'

  # Tracks
  resources :parties
  namespace :party do
    get '/:slug/tracks', to: 'tracks#index', as: :tracks
    post '/:slug/tracks/', to: 'tracks#create'
  end

  # Albums
  get '/albums', to: 'albums#search'
end
