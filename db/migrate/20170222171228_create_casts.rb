class CreateCasts < ActiveRecord::Migration
  def up
    create_table :casts do |t|
      t.references :movie
      t.references :user
      t.string :as
      t.string :role
      t.timestamps null: false
    end
  end
  def down
    drop_table :casts
  end
end
