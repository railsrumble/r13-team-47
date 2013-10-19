class RenameScreenshootToScreenshot < ActiveRecord::Migration
  def change
    rename_table :screenshoots, :screenshots
  end
end
