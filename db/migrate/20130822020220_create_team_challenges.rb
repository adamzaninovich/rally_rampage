class CreateTeamChallenges < ActiveRecord::Migration
  def change
    create_table :team_challenges do |t|
      t.integer :rank

      t.timestamps
    end
  end
end
