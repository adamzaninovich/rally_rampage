class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.float :pax

      t.timestamps
    end
  end
end
