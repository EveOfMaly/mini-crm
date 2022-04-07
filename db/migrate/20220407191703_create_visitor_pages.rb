class CreateVisitorPages < ActiveRecord::Migration[6.1]
  def change
    create_table :visitor_pages do |t|
      t.integer :visitor_id
      t.integer :page_id
      t.timestamps
    end
  end
end
