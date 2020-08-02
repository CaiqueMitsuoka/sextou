class SnapshotController < ApplicationController
  before_action :authenticate!

  PER_PAGE = 25

  def index
    @playlists = current_user.spotify_account.playlists(offset: offset, limit: PER_PAGE)
    @next_page = page + 1
    @per_page = PER_PAGE
  end

  def create
    if snapshot_params.valid?
      SnapshotPlaylistJob.perform_later(current_user.id, snapshot_params.playlist_id)

      redirect_to "/", notice: 'Sua Playlist será copiada nos próximos minutos 🤙'
    else
      redirect_to snapshot_index_path, notice: 'Link inválido 🙅‍♀️'
    end
  end

  private

  def snapshot_params
    @snapshot_params ||= SnapshotParams.new(params)
  end

  def offset
    (page - 1) * PER_PAGE
  end

  def page
    (params[:page] || 1).to_i
  end
end
