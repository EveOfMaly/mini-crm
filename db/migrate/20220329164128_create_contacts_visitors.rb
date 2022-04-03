class CreateContactsVisitors < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts_visitors do |t|
      t.integer :contact_id
      t.integer :visitors_id
      t.timestamps
    end
  end
end
