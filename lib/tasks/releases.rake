namespace :releases do
  desc "TODO"
  task update_discover_playlist: :environment do
    User.all.each do |user|
      Releases::Discover.new(user).execute
    end
  end
end
