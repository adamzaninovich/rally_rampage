class AddAttributesToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :driver, :string
    add_column :teams, :navigator, :string
    add_column :teams, :vehicle, :string
  end
end
