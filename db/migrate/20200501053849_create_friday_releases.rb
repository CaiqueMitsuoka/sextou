class CreateFridayReleases < ActiveRecord::Migration[6.0]
  def change
    create_table :friday_releases do |t|
      t.integer :user_id, unique: true
      t.string :playlist_id

      t.timestamps
    end

    add_index :friday_releases, :user_id, unique: true
  end
end
