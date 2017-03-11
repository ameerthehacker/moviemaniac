class CreateFollowers < ActiveRecord::Migration
  def up
    create_table :followers, :id=>false do |t|
      t.references :user
      t.references :follower
      t.timestamps null: false
    end
  end
  def down
    drop_table :followers
  end
end
