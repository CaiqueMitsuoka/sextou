class PartiesController < ApplicationController
  before_action :authenticate!

  # GET /parties
  def index
    binding.pry
    @parties = current_user.parties
  end

  # GET /parties/new
  def new
    @party = Party.new()
  end

  # POST /parties
  def create
    @party = Party.new(party_params)
    playlist = Playlist::Create.new(@party.name, current_user).execute

    @party.playlist_id = playlist.id
    @party.user = current_user

    if @party.save
      redirect_to @party, notice: 'Party was successfully created.'
    else
      render :new
    end
  end

  private
    def party_params
      params.require(:party).permit(:name)
    end
end
