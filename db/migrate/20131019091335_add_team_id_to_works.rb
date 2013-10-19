class AddTeamIdToWorks < ActiveRecord::Migration
  def change
    add_column :works, :team_id, :integer
    add_index :works, :team_id
  end
end
