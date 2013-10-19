class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :url
      t.text :description
      t.integer :level
      t.integer :score

      t.timestamps
    end
  end
end
