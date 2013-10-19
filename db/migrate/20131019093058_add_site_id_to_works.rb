class AddSiteIdToWorks < ActiveRecord::Migration
  def change
    add_column :works, :site_id, :integer
    add_index :works, :site_id
  end
end
