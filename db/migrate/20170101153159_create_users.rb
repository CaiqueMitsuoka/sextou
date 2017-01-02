class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :user_raw
      t.string :session_id

      t.timestamps
    end
  end
end
