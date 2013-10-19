class AddScreenshotToScores < ActiveRecord::Migration
  def change
    add_column :scores, :screenshot, :string
  end
end
