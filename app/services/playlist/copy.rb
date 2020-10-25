# frozen_string_literal: true

module Playlist
  class Copy
    OFFSET_LIMIT = 100

    include SpotifyRequestHandler

    def initialize(user, playlist)
      @user = user
      @playlist = playlist
      @tracks = []
    end

    def execute!
      get_tracks!

      create_playlist!

      add_tracks!

      update_playlist_details!
    end

    private

    attr_accessor :user, :playlist, :new_playlist

    def name
      @name ||= "#{playlist.name} - 📷 #{Time.now.strftime("%d/%m/%Y")}"
    end

    def create_playlist!
      spotify_request do
        @new_playlist = user.create_playlist("Copying")
      end
    end

    def get_tracks!
      pages = (playlist.total / OFFSET_LIMIT) + 1

      (0...pages).each do |page|
        spotify_request do
          @tracks << playlist.tracks(limit: OFFSET_LIMIT, offset: page * OFFSET_LIMIT)
        end
      end
    end

    def add_tracks!
      puts @tracks
      @tracks.flatten.each_slice(100) do |tracks_batch|
        spotify_request do
          @new_playlist.add_tracks!(tracks_batch)
        end
      end
    end

    def update_playlist_details!
      spotify_request do
        new_playlist.change_details!(
          name: name,
          description: description,
          collaborative: false,
          public: false
        )
      end
    end

    def description
      if playlist.description.present?
        playlist.description
      else
        "Snapshot by sextou.app 📷"
      end
    end
  end
end
