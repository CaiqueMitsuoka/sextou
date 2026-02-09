Rails.application.routes.draw do
  get '/', to: 'sextou#home'

  get '/login', to: 'spotify#new'
  get '/auth/spotify/callback', to: 'spotify#spotify'

  resources :parties, only: [:index, :new, :create]
  namespace :party do
    get '/:slug/tracks', to: 'tracks#index', as: :tracks
    post '/:slug/tracks/', to: 'tracks#create'
  end

  namespace :admin, constraints: UserIsAdmin do
    mount MissionControl::Jobs::Engine, at: "/jobs"

    resources :releases_playlists, to: 'admin/releases_playlists', only: :index
  end

  resources :friday_releases, only: [:new, :create, :destroy]
  resources :snapshot, only: [:index, :create]
end
