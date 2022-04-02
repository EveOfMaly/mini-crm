class CreateVisitors < ActiveRecord::Migration[6.1]
  def change
    create_table :visitors do |t|
      t.string :name
      t.text :last_visit
      t.string :region
      t.string :city
      t.string :referring_domain
      t.string :country_code
      t.integer :app_id
      
      t.timestamps
    
    end
  end
end
