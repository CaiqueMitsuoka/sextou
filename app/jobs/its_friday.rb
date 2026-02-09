class ItsFriday < ApplicationJob
  queue_as :spotify

  def perform
    User.all.each do |user|
      UpdateFridayPlaylistJob.perform_later(user.id)
    end
  end
end
