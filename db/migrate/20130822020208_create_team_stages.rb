class CreateTeamStages < ActiveRecord::Migration
  def change
    create_table :team_stages do |t|
      t.integer :rank

      t.timestamps
    end
  end
end
