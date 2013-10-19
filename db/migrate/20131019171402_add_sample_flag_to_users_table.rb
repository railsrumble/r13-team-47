class AddSampleFlagToUsersTable < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.boolean :sample
    end
  end
end
