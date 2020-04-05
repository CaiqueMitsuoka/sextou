class CreateParties < ActiveRecord::Migration[6.0]
  def change
    create_table :parties do |t|
      t.string :name
      t.string :slug
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :parties, :slug, unique: true
  end
end
