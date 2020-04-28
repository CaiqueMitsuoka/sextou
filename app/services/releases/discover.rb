module Releases
  class Discover
    attr_reader :user

    def initialize(user)
      @user = user
    end

    def execute
      playlist = ::Playlist::Create.new("🔥Sextou lançamentos🎉", user).execute
      date_limit = 7.days.ago.beginning_of_day

      artists.each do |artist|
        releases = albums(artist)

        new_releases = releases.select do |album|
          if album.release_date_precision == "day"
            DateTime.iso8601(album.release_date) > date_limit
          else
            false
          end
        end

        new_releases.each do |album|
          puts "Adicionando #{album.name} de #{album.release_date}"
          playlist.add_tracks!(album.tracks)
        end
      end
    end

    private

    def artists
      artists = []
      last_artist_id = nil

      (1..100).detect do |page_number|
        page_artists = user.spotify_account.following(type: 'artist', limit: 50, after: last_artist_id)

        artists.concat(page_artists)
        last_artist_id = page_artists.last.id

        page_artists.count < 50
      end

      artists
    end

    def albums(artist)
      albums = []
      offset = 0

      (1..50).detect do |page_number|
        page_albums = artist.albums(limit: 50, offset: offset)

        offset += 50

        albums.concat(page_albums)

        page_albums.count < 50
      end

      albums.sort {|a,b| a.release_date <=> b.release_date}.reverse
    end
  end
end
