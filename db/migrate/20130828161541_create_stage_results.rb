class CreateStageResultsAndChallengeResults < ActiveRecord::Migration
  def change

    create_table :challenge_results do |t|
      t.belongs_to  :team
      t.belongs_to  :challenge

      t.integer     :placement

      t.timestamps
    end
  end
end
class CreateStageResults < ActiveRecord::Migration
  def change
    create_table :stage_results do |t|
      t.belongs_to  :team
      t.belongs_to  :stage

      t.integer     :placement
      t.datetime    :start_time
      t.datetime    :finish_time
      t.integer     :start_odometer
      t.integer     :finish_odometer

      t.timestamps
    end

  end
end
