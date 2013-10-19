class DeleteScreenshots < ActiveRecord::Migration
  def change
    drop_table :screenshots 
  end
end
