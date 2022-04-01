class CreateApps < ActiveRecord::Migration[6.1]
  def change
    create_table :apps do |t|
      t.integer :user_ids
      
      t.timestamps
    end
  end
end
