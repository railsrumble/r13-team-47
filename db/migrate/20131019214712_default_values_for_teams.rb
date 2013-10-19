class DefaultValuesForTeams < ActiveRecord::Migration
  def change
    change_column :teams, :level, :integer, :default => 0
    change_column :teams, :score, :integer, :default => 0
  end
end
