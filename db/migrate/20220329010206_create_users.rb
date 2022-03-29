class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.text :passord_digest
      t.text :email
     
      t.timestamps
    end
  end
end
