# frozen_string_literal: true

module Playlist
  class Create
    attr_reader :party_name, :user

    def initialize(party_name, user)
      @party_name = party_name
      @user = user
    end

    def execute
      persist
    end

    private

    def persist
      user.create_playlist(party_name)
    end
  end
end
