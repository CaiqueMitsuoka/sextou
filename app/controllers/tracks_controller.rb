class TracksController < ApplicationController
  def search
    @tracks = RSpotify::Track.search(params.require(:track))
  end
end
