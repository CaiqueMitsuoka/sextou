module Releases
  class Discover
    attr_reader :user

    def initialize(user)
      @user = user
    end

    def execute
      all_releases = []

      artists.each {|artist| all_releases << albums(artist)}
      new_releases = all_releases.flatten.select {|album| is_new?(album)}.uniq!(&:id).uniq!(&:name)

      new_releases.each do |album|
        user.playlist.add_tracks!(album.tracks)
      end
    end

    private

    def artists
      @artists ||= fetch_artists
    end

    def is_new?(album)
      if album.release_date_precision == "day"
        DateTime.iso8601(album.release_date) > date_limit
      else
        false
      end
    end

    def albums(artist)
      albums = []
      offset = 0

      (1..50).detect do |page_number|
        page_albums = artist.albums(limit: 50, offset: offset, include_groups: 'album,single')

        offset += 50

        albums.concat(page_albums)

        page_albums.count < 50
      end

      albums.sort {|a,b| a.release_date <=> b.release_date}.reverse
    end

    def date_limit
      @date_limit ||= 7.days.ago.beginning_of_day
    end

    def fetch_artists
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
  end
end
