class CreateTeams < ActiveRecord::Migration
  def up
    create_table :teams do |t|
      t.references :movie
      t.string :role
      t.timestamps null: false
    end
  end
  def down
    drop_table :teams
  end
end
