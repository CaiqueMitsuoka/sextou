# frozen_string_literal: true

class User < ApplicationRecord
  has_many :parties

  def current_raw
    RSpotify::User.new(JSON.parse(user_raw))
  end

  def create_playlist(name)
    current_raw.create_playlist!(name)
  end
end
