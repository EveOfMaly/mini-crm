class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.integer :spent
      t.integer :age
      t.string :email
      t.string :gender
      t.text :first_seen
      t.text :last_visit
      t.string :region
      t.string :city
      t.string :referring_domain
      t.string :country_code
      t.integer :app_id
      t.integer :user_id

      t.timestamps
    end
  end
end
