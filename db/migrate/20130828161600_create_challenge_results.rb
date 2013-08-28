class CreateChallengeResults < ActiveRecord::Migration
  def change
    create_table :challenge_results do |t|
      t.belongs_to  :team
      t.belongs_to  :challenge

      t.integer     :placement

      t.timestamps
    end
  end
end
