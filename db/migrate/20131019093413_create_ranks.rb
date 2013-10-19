class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.integer :points
      t.references :site, index: true

      t.timestamps
    end
  end
end
