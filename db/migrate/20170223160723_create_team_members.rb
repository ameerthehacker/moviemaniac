class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.references :user
      t.references :team
      t.timestamps null: false
    end
  end
end
