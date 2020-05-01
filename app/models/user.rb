# frozen_string_literal: true

class User < ApplicationRecord
  has_many :parties
  has_one :friday_release

  attribute :user_raw, :encrypted, type: :json, compress: true

  validates :name, :user_raw, :session_id, presence: true

  def create_playlist(name)
    spotify_account.create_playlist!(name)
  end

  def spotify_account
    RSpotify::User.new(user_raw)
  end
end
