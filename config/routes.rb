require 'sidekiq/web'

Rails.application.routes.draw do
  get '/', to: 'spotify#home'
  get '/auth/spotify/callback', to: 'spotify#spotify'

  resources :parties, only: [:index, :new, :create]
  namespace :party do
    get '/:slug/tracks', to: 'tracks#index', as: :tracks
    post '/:slug/tracks/', to: 'tracks#create'
  end

  mount Sidekiq::Web => '/sidekiq', constraints: UserIsAdmin

  resources :friday_releases, only: [:new, :create, :destroy]
  resources :snapshot, only: [:index, :create]
end
