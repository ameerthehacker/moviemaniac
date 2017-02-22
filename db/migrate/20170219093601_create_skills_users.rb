class CreateSkillsUsers < ActiveRecord::Migration
  def change
    create_table :skills_users, :id=>false do |t|
      t.references :user
      t.references :skill   
    end
  end
end
