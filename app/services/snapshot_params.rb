class SnapshotParams
  def initialize(params)
    @params = params
  end

  def valid?
    playlist_id.present?
  end

  def playlist_id
    @playlist_id ||= params["playlist_id"] || from_link
  end

  private
  attr_reader :params

  def from_link
    link = URI.parse(params["link"])

    link.path.match(/(?:\/playlist\/)(\w+)/)[1]
  end
end
