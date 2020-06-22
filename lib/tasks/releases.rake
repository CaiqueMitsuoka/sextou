namespace :releases do
  FRIDAY_WEEKDAY = 6

  desc "TODO"
  task update_discover_playlist: :environment do
    update_discover_playlist
  end

  desc "TODO"
  task friday: :environment do
    if friday?
      update_discover_playlist
    end
  end

  def update_discover_playlist
    User.all.each do |user|
      Releases::Discover.new(user).execute
    end
  end

  def friday?
    return true if Rails.env.development?

    Time.current.wday == FRIDAY_WEEKDAY
  end
end
