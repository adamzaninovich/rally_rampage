class CreateTeamsStagesAndChallenges < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string      :name
      t.string      :driver
      t.string      :navigator
      t.string      :vehicle
      t.float       :pax

      t.timestamps
    end

    create_table :stages do |t|
      t.integer     :order_number
      t.integer     :ideal_time
      t.float       :pax_percent
      t.string      :type

      t.timestamps
    end

    create_table :challenges do |t|
      t.integer     :order_number
      t.string      :name

      t.timestamps
    end
  end
end

class CreateStageResultsAndChallengeResults < ActiveRecord::Migration
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

    create_table :challenge_results do |t|
      t.belongs_to  :team
      t.belongs_to  :challenge

      t.integer     :placement

      t.timestamps
    end
  end
end
