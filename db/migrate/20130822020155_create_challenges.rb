class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.integer :order_number

      t.timestamps
    end
  end
end
