class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.integer :owner_id
      t.string :video
      t.text :caption
      t.integer :views
      t.boolean :viewed_by_user

      t.timestamps
    end
  end
end
