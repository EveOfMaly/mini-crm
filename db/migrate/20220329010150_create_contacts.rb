class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.integer :age
      t.string :email
      t.string :gender
      t.text :last_visit
      t.string :region
      t.string :city
      t.string :referring_domain
      t.string :country_code
      

      t.timestamps
    end
  end
end
