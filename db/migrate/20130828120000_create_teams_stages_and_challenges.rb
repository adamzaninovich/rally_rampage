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

