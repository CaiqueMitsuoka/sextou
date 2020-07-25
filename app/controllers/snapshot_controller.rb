class SnapshotController < ApplicationController
  before_action :authenticate!

  PER_PAGE = 25

  def index
    @playlists = current_user.spotify_account.playlists(offset: offset, limit: PER_PAGE)
    @next_page = page + 1
    @per_page = PER_PAGE
  end

  def create
    SnapshotPlaylistJob.perform_later(current_user.id, snapshot_params)

    redirect_to parties_path, notice: 'Sua Playlist será copiada nos próximos minutos 🤙'
  end

  private

  def snapshot_params
    params.require("playlist_id")
  end

  def offset
    (page - 1) * PER_PAGE
  end

  def page
    (params[:page] || 1).to_i
  end
end
