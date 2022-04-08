class CreateIdentities < ActiveRecord::Migration[6.1]
  def change
    create_table :identities do |t|
      t.integer :visitor_id
      t.integer :contact_id
      t.timestamps
    end
  end
end
