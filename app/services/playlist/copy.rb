# frozen_string_literal: true

module Playlist
  class Copy
    OFFSET_LIMIT = 100

    def initialize(user, playlist)
      @user = user
      @playlist = playlist
    end

    def execute!
      create_playlist!

      copy_tracks!

      update_playlist_details!
    end

    private

    attr_accessor :user, :playlist, :new_playlist

    def name
      @name ||= "#{playlist.name} - 📷 #{Time.now.strftime("%d/%m/%Y")}"
    end

    def create_playlist!
      @new_playlist = user.create_playlist("Copying")
    end

    def copy_tracks!
      pages = (playlist.total / OFFSET_LIMIT) + 1

      (0...pages).each do |page|
        tracks = playlist.tracks(limit: OFFSET_LIMIT, offset: page * OFFSET_LIMIT)

        new_playlist.add_tracks!(tracks)
      end
    end

    def update_playlist_details!
      new_playlist.change_details!(
        name: name,
        description: description,
        collaborative: false,
        public: false
      )
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
