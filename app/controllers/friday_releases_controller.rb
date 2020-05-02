class FridayReleasesController < ApplicationController
  before_action :set_friday_release, only: :destroy

  def new
    @friday_release = FridayRelease.new
  end

  def create
    @friday_release = FridayRelease.new(user: current_user)

    if @friday_release.save
      redirect_to parties_url, notice: 'Friday release was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @friday_release.destroy

    redirect_to parties_url, notice: 'Friday release was successfully stopped.'
  end

  private

  def set_friday_release
    @friday_release = FridayRelease.find(params[:id])
  end
end
