require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

if ! Rails.env.production?
  Dotenv::Railtie.load
end

RSpotify::authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_SECRET_ID"])

module Sextou
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.0

    config.active_job.queue_adapter = :sidekiq
  end
end
