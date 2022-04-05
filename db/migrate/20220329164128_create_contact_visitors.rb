class CreateContactVisitors < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_visitors do |t|
      t.integer :contact_id
      t.integer :visitor_id
      t.timestamps
    end
  end
end
