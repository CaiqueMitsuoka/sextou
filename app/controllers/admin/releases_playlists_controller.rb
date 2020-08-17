class Admin::ReleasesPlaylistsController < ApplicationController
  def index
    @releases = FridayRelease.all
  end
end
