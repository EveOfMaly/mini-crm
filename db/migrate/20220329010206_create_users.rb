class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.text :password_digest
      t.text :email
      t.integer :uid
      t.string :provider
      t.timestamps
    end
  end
end
