class CreateAppUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :app_users do |t|
      t.integer :app_id
      t.integer :user_id

      t.timestamps
    end
  end
end
