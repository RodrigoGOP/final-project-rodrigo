class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :video_id
      t.integer :author_id

      t.timestamps
    end
  end
end
