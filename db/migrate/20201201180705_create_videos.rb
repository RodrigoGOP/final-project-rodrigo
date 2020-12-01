class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.integer :owner_id
      t.string :video
      t.text :caption
      t.integer :views, { :default => 0 }
      t.boolean :viewed_by_user, { :default => false }

      t.timestamps
    end
  end
end
