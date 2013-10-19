class RenameRankIdToScoreId < ActiveRecord::Migration
  def change
    rename_column :screenshots, :rank_id, :score_id
  end
end
