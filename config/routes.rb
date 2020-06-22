Rails.application.routes.draw do
  get '/', to: 'spotify#home'
  get '/auth/spotify/callback', to: 'spotify#spotify'

  # Tracks
  resources :parties, only: [:index, :new, :create]
  namespace :party do
    get '/:slug/tracks', to: 'tracks#index', as: :tracks
    post '/:slug/tracks/', to: 'tracks#create'
  end

  resources :friday_releases, only: [:new, :create, :destroy]
end
