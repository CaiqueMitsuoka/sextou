class AlbumsController < ApplicationController
  def search
    @albums = RSpotify::Albums.search(params.require(:album))
  end
end
