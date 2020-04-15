# frozen_string_literal: true

class Party::TracksController < ApplicationController
  before_action :set_party, only: [:index, :create]

  def index
    @party_slug = @party.slug
    @tracks = search_track_name(params[:track_name].presence)
  end

  def create
    @party.add_tracks(params[:track_id])
    redirect_to party_tracks_path
  end

  private

  def set_party
    @party = Party.friendly.find(params[:slug])
  end

  def search_track_name(track_name)
    if track_name
      RSpotify::Track.search(track_name)
    else
      []
    end
  end
end
