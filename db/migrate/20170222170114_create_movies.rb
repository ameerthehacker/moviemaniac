class CreateMovies < ActiveRecord::Migration
  def up
    create_table :movies do |t|
      t.string :title
      t.text :concept
      t.string :youtube_link
      t.references :user
      t.timestamps null: false
    end
  end
  def down
    drop_table :movies
  end
end
