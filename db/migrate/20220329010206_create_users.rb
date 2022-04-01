class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.text :password_digest
      t.text :email
      t.string :uid, limit: 500 #google limit uid length is quite large have to change to BIGINT
      t.string :provider
      t.integer :app_id
      t.timestamps
    end
  end
end
