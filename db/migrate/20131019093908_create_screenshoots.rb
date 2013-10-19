class CreateScreenshoots < ActiveRecord::Migration
  def change
    create_table :screenshoots do |t|
      t.references :rank, index: true

      t.timestamps
    end
  end
end
