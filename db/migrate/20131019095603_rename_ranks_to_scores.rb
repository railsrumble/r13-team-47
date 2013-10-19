class RenameRanksToScores < ActiveRecord::Migration
  def change
    rename_table :ranks, :scores
  end
end
