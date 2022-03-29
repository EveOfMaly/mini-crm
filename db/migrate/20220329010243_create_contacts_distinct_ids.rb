class CreateContactsDistinctIds < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts_distinct_ids do |t|
      t.integer :contacts
      t.integer :distinct_ids
      t.timestamps
    end
  end
end
