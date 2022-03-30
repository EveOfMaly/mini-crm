class CreateContactsVisitors < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts_visitors do |t|
      t.integer :contacts
      t.integer :visitors
      t.timestamps
    end
  end
end
