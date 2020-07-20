class UpdateFridayPlaylistJob < ApplicationJob
  queue_as :spotify

  def perform(user_id)
    user = User.find(user_id)

    Releases::Discover.new(user).execute
  end
end
