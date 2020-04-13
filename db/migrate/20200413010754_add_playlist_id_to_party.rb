class AddPlaylistIdToParty < ActiveRecord::Migration[6.0]
  def change
    add_column :parties, :playlist_id, :string
  end
end
