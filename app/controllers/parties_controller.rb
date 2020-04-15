class PartiesController < ApplicationController

  # GET /parties
  def index
    @parties = Party.all
  end

  # GET /parties/new
  def new
    @party = Party.new
  end

  # POST /parties
  def create
    @party = Party.new(party_params)
    playlist = Playlist::Create.new(@party.name, current_user).execute
    @party.playlist_id = playlist.id

    respond_to do |format|
      if @party.save
        redirect_to @party, notice: 'Party was successfully created.'
      else
        render :new
      end
    end
  end

  private
    def party_params
      params.require(:party).permit(:name, :slug, :user_id)
    end
end
